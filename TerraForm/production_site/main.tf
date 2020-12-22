# Setting up a Terraform environment from scratch
# The site will be spun up in Oregon

provider "aws" {
  region = "us-west-2"
}

# Providing the over arching factor that manages the private cloud network
resource "aws_vpc" "production" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Production"
  }
}

# Allow our EC2 resource to talk to the internet and clients to talk to it
# This will allow us to SSH to it
resource "aws_internet_gateway" "production" {
  vpc_id = aws_vpc.production.id

    tags = {
    Name = "Production"
  }
}

# Then we provide a subnet (a place for it to live in)
# Tagged with production

resource "aws_subnet" "production" {
  vpc_id = aws_vpc.production.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-west-2a"

    tags = {
    Name = "Production"
  }
}

# Route Table
# Network ACL
# Security Group

resource "aws_route_table" "default" {
  vpc_id = aws_vpc.production.id

    tags = {
    Name = "Production"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.production.id

     

  }
}


resource "aws_route_table_association" "production" {
  subnet_id      = aws_subnet.production.id
  route_table_id = aws_route_table.default.id

}

# What ports will you expose for outgoing egress and incoming ingress
# Rule_no is the rule number in regards to priority and location within the stack
resource "aws_network_acl" "allow-all" {
  vpc_id = aws_vpc.production.id

  tags = {
    Name = "Production"
  }
  # protocol of -1 allows both UDP and TCP   
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

# Allows SSH inbound
resource "aws_security_group" "allow-all" {
  name        = "clexys launchers and environment"
  description = "allows all traffic"
  vpc_id      = aws_vpc.production.id

  tags = {
    Name = "Production"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Elastic IP
# SSH Key
# Dynamic AMI ID

resource "aws_eip" "webserver" {
  instance   = aws_instance.webserver.id
  vpc        = true
  depends_on = [aws_internet_gateway.production]

  tags = {
    Name = "Production"
  }

}

# Then you need your pem aka ssh key
resource "aws_key_pair" "you-have-a-pem-already" {
  key_name   = "halfaway"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVndyPeI43/OIobZzipGyoBxIhUmZOul6Vb2uIytE//kGK/S7+Go1kiIF5KXEop5/MN+G/Ujkbw+eOO26p0uNdjBfR20UP+MT86+s8cDr9DNFGP0sBwz5xtw2P9b7AHpA+v50ZtgMD6K7tlLdIdI3937tfYbOQyhHC1nCLkaKjl/fowMUqqwNZgtfyZ6b7sqatCRUk1uwAAyBCsMEAvNMdiltCfTFLWLdLHosl01YCUIpZFrF1/UrsDiaPzaAqMYEOK+1TyRqAR/Ddd2f4/1EfLh4rauQbpB9ynp7LSLp489vQfNWlrLLq2X5l9UTWlKKdM96cz7R0GS0LlqYrCMuiyFKPqabrGhr71qTYQg229abl0z9BD59dHOf50EB/SHbJsn64b2PBaAbGKFnruBS/Dxkhtd8zzQNxqjJMEUUtkD4pmj70hV+fhlUpJIgMiHX4nYBBSPWnEJL8qH8IIeSZi/luBABh8AxDEcwflmSlyYzj7cFxNn55IuCXED+U1TkvynhEYhwTson3TX+bVZtRtb/3Uel8DoUOjuOSSwTUxtJptiW9GcihL+NUUUEC0eHlRvr14USTQVCy5wScU19o70xRDzhCMq45k+wKvUmFsDFDLkCQkLF96l0sCnkP2UVxkQvJ+BqYt9kHQXTKE4Suw6ZlqdUAmuavtlroGCUTMQ== hawaiideveloper@CoreyzMacBookPro"
}

# The EC2 instance we will need a data block does not create it fecthes
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical creator themselves
}

# Create the EC2 instance

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu.id
  availability_zone      = "us-west-2a"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.you-have-a-pem-already.key_name
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = aws_subnet.production.id

    tags = {
    Name = "Production"
  }
}

# we tell terraform to give us the elastic IP address of our instance
output "public_ip" {
  value = aws_eip.webserver.public_ip
}
