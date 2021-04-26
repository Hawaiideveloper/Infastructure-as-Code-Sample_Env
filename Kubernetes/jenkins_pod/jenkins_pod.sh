#!/bin/bash

# create the Jenkins namespace
kubectl create namespace jenkins

# deployment in the jenkins namespace
kubectl create -f jenkins.yaml --namespace jenkins

# verify the pod’s state
kubectl get pods -n jenkins

# Now create the Service in the same namespace
kubectl create -f jenkins-service.yaml --namespace jenkins

# Check that the Service is running
kubectl get services --namespace jenkins


# Use kubectl to retrieve your node IPs
kubectl get nodes -o wide

# retrieve your Pod name
kubectl get pods -n jenkins

# please enter the following
echo "kubectl logs jenkins-example777-twnvn -n jenkins"

sleep 3

echo "scroll down and look for...  password to proceed to installation:"

