#!/bin/bash

echo "The script will mount an S3 file system to your host"

echo "If things go right we can test with Ansible"

echo "Its location will be within the '~/s3-drive' "

bucketLocation=[your existing s3 created with the "create_s3.sh script"]

ACCESS_KEY=[enter your access key here]

SECRET_KEY=[enter your secret key here]

#Update the needed packages and reference to repos
sudo apt-get update

# Setup awsCLI
sudo apt  install awscli -y


# Using apt-get, it can be installed by using the command below
sudo apt-get install s3fs -y

#set up the credentials as shown below
# don't worry Jenkins will at some point store this for us

echo ACCESS_KEY_ID:SECRET_ACCESS_KEY > ${HOME}/.passwd-s3fs

# set the right access permission for the passwd-s3fs file to run S3FS successfully
chmod 600 ${HOME}/.passwd-s3fs


# Create a mount directory for future s3 access
mkdir ~/s3-mounted-drive

# Mount the Amazon S3 bucket. Create a folder the Amazon S3 bucket will mount to
s3fs $bucketLocation ~/s3-drive -o passwd_file=${HOME}/.passwd-s3fs