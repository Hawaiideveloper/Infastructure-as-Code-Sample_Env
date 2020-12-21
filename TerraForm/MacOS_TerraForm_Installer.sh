#!/bin/bash


### Install TerraForm for MacOS

###### First, install the HashiCorp tap, a repository of all our Homebrew packages.

brew tap hashicorp/tap


###### Now, install Terraform


brew install hashicorp/tap/terraform



###### Verify it works

terraform -help
