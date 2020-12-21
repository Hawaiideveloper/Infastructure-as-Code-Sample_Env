# Using AWS for the Dev example
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

  azs             = ["eu-west-1a", "eu-west-1b", "euw1-az3"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}
