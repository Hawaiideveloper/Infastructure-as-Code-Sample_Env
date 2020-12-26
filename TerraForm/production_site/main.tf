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
  vpc_id            = aws_vpc.production.id
  cidr_block        = "10.1.1.0/24"
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
     description = "Allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 }

  ingress {
     description = "Allow Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Serve websites"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


ingress {
    description = "Serve secure websites"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
    description = "Serve Dev websites"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

/*
    ingress {
    description = "Jenkins site"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
*/



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
# The public ssh key can be changed frequently as needed
variable "public_ssh_key" {
   type = string
   description = "Dev instances"
  
}

# Then you need your pem aka ssh key
resource "aws_key_pair" "you-have-a-pem-already" {
  key_name   = "halfaway"
  public_key = var.public_ssh_key
}

# The EC2 instance we will need a data block does not create it fecthes
data "aws_ami" "ubuntu" {
most_recent = true

# https://cloud-images.ubuntu.com/locator/ec2/ 
# The above link provides images ami-ids directly from ubuntu

  filter {
    name   = "image-id"
    values = ["ami-0c007ac192ba0744b"]
  }
   owners = ["099720109477"] # Canonical creator themselves
}


  # use this to filter deeper if you ever decide keep up with a particular provider like Canonical
/*
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

*/

# Create the EC2 instance (then look into the terraform.tfvars file)
variable "dev_instance_type" {
  type = string
  description = "Dev instances"
  }
  

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu.id
  availability_zone      = "us-west-2a"
  instance_type          = var.dev_instance_type
  key_name               = aws_key_pair.you-have-a-pem-already.key_name
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = aws_subnet.production.id

  tags = {
    Name = "Clexys-Docker-Host"
  }
}

# we tell terraform to give us the elastic IP address of our instance
output "public_ip" {
  value = aws_eip.webserver.public_ip
}
