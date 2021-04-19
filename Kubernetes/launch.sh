#!/bin/bash





# Initialize the kubeadm 
sudo kubeadm init


# Provide cluster version
kubectl version -o json


# Provide cluster information
kubectl cluster-info dump

# Show current ip address
ip add sh




