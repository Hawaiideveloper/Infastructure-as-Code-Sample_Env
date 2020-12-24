#!/bin/bash






bucketLocation=[your desired bucket name]


#Update the needed packages and reference to repos
sudo apt-get update


# Setup awsCLI
sudo apt  install awscli -y


# Using apt-get, it can be installed by using the command below
sudo apt-get install s3fs -y


# Now you need to get those credentials working automatically
 mkdir -p ~/.aws

# Post your credentials manaully here
nano ~/.aws/credentials

# Setup where your aws config file
nano ~/.aws/config

#creates bucket
aws s3 mb s3://$bucketLocation --region us-west-2





