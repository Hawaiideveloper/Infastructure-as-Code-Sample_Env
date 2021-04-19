#!/bin/bash



# Show current ip address
ip add sh


# Start the local kubernetes cluster called miniKube
minikube start


# List all running name spaces
kubectl get po -A

# Create alias
kubectl="minikube kubectl --"

# Create perm symbolic link
ln -s $(which minikube) /usr/local/bin/kubectl

# Reports both control plane and KubeDNS
kubectl cluster-info