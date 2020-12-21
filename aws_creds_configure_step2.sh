#!/bin/bash


echo " You will need the following files:"


echo "~/.aws/credentials"

echo "~/.aws/config"


echo "you can create these files using the command:"

echo "aws configure"

echo "# You will then see a prompt for your Access Key ID like below"

echo "AWS Access Key ID [****************MPLE]:"

echo "# You will then see a prompt for your Access Key ID like below"

echo "AWS Secret Access Key [****************EKEY]:"

echo "Then please select the region and output format it is suggested to create in the closest region to your home or corporate office"

echo "Now starting..."

aws configure
