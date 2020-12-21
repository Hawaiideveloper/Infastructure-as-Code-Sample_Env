#!/bin/bash


### Install TerraForm for Linux Ubuntu

###### Add the HashiCorp GPG key.

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -


###### Add the official HashiCorp Linux repository.

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"


###### Update and install

Update and install


###### Verify it works

terraform -help


