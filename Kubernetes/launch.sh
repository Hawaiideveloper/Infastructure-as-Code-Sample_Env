#!/bin/bash



# Show current ip address
ip add sh


# Start the local kubernetes cluster called miniKube
minikube start


# List all running name spaces
kubectl get po -A


