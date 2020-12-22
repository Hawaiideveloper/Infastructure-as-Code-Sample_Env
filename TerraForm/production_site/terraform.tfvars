dev_instance_type = "t2.micro"
public_ssh_key = "[remove the brackets and put your public ssh key here]"



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


