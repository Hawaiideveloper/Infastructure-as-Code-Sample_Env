dev_instance_type = "t2.micro"
public_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCZsEeeSp3M+y+SNpw5Sz1BahnW2iK9TVTCPPdIUMCj5HKgdINABOIWk5LzGPW7FyCDEHNdz0IniGrtC0v/aUY7fH0s1ODJiJ5BsJs1vhQzatnYx+xpNqjCgcKWHFWWFmY4xbVO1ZD8ONwbLzPNjubmp1lyH/42bSPOzQ5MGSvpOw8tcg5V1mp7C11c5w8tGPQyQby1T50ijgRAc6p6/I/xTmC8dF2iGpwhEzXPoAqWqHwP2607nz7YHv3fSXIMmeu5tgOb+7oKeMGEjfpU3qRSNO5CTRxwIYztuC8yafa2Af46lNZ+MKc9Wr+4tVFj8CiRw5vmuspLGZrW3YuwO49R"



# read below for more information....





# Use this file to setup standard dev environment

/* if you were to place this into the main.tf it would be written inline like so 

variable "instance_type" {
type = string
description = "EC2 size of instance"
default = "t2.micro"

i.e. 

Look for this in the main file:
"
# Create the EC2 instance (then look into the terraform.tfvars file)
variable "dev_instance_type" {
  type = string

"
as the above line makes it possible and you need to use the terraform.tfvars as the variable
file, because I tried a different name and it did not work.


*/


