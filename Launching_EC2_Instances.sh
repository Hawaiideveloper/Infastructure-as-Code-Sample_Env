#!/bin/bash


# Now we test our AWSCLI



echo "Hopefully your AWS keys are setup correctly"

echo "Now testing our AWS CLI"


echo "Step 1 check versions"
aws --version

echo " Step 2 now we want to launch an instance"
aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e

echo "Step 3 now we want to terminate that instance"
