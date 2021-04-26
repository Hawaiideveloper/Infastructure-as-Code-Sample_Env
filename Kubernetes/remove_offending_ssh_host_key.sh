#!/bin/bash





echo "Please enter number of offending line within damaged or man in middle attack"



# Method 1: Pass host name or IP
echo "Please enter the hostname or IP address to remove from known_host file" 

read host


# Uncomment the below to remove the host by typing its name or IP address
ssh-keygen -R "$removing_host"






# Method 2: Remove the offending line


# Remove the line and allow us to quickly get started with less lines of code


#echo "Please enter_offending_line"
#read line_offending
#sed '"$line_offending"d' known_hosts
