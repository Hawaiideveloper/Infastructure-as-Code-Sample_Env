#!/bin/bash

echo "The script will mount an S3 file system to your host"

echo "If things go right we can test with Ansible"

echo "Its location will be within the '~/s3-drive' "

bucketLocation = 

# Using apt-get, it can be installed by using the command below
sudo apt-get install s3fs -y



# set up the credentials as shown below
# don't worry Jenkins will at some point store this for us

echo ACCESS_KEY:SECRET_KEY > ~/.passwd-s3fs
cat ~/ .passwd-s3fs ACCESS_KEY:SECRET_KEY


# set the right access permission for the passwd-s3fs file to run S3FS successfully
chmod 600 .passwd-s3fs

# Mount the Amazon S3 bucket. Create a folder the Amazon S3 bucket will mount to
mkdir ~/s3-drive
s3fs $bucketLocation ~/s3-drive