#!/bin/bash


# Change directory and Launch the terraform configuration
terraform -chdir=../TerraForm/production_site apply -auto-approve


# Next go to Ansible and use the IP Address as a node to configure
cd ../Ansible/Production/Docker_playbook





# The below command gives up the ip address of the public_ip
# aws_pub_ip_address=cat ../TerraForm/production_site/terraf.tfstate | sed '8!d' | cut -d ":" -f 2 | cut -b 3-15





