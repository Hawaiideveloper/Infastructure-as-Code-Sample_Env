# Using AWS for the Private [Dev 10.0.(1), Staging 10.0.(2), and Production 10.0.(3)] example
provider "aws" {
  region = "us-west-2"
}

/*
A Module is a container for multiple resources that are used together. 
Modules can be used to create lightweight abstractions, 
so that you can describe your infrastructure in terms of its architecture, 
rather than directly in terms of physical objects.
*/

module "vpc" {
  source = "../../"

  name = "Dev-vpc"

  cidr = "10.0.0.0/16"

  
  # US West (Oregon) us-west-2 has 4 2a-2d
  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  # you can uncomment but I do not want ipv6
  #enable_ipv6 = true
  enable_ipv6 = false

  /* By default this module will provision new Elastic IPs for the VPC's NAT Gateways. 
This means that when creating a new VPC, new IPs are allocated, and when that VPC is destroyed those IPs are released. 
Sometimes it is handy to keep the same IPs even after the VPC is destroyed and re-created. 
To that end, it is possible to assign existing IPs to the NAT Gateways. 
This prevents the destruction of the VPC from releasing those IPs, 
while making it possible that a re-created VPC uses the same IPs.
  */

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "Corey"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}
