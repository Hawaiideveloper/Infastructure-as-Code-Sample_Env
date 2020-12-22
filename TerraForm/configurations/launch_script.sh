#!/bin/bash


terraform fmt

terraform init



# Create the infrastructure and prompt for yes
terraform apply


#Inspect the current state using 

terraform show
