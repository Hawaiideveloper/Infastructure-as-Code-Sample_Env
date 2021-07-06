#!/bin/bash

# Prerequisties 
echo "please ensure you have docker installed, and are running on ubuntu"


echo "steps are:"
echo "Download"
echo "install"
echo "add user to docker group"
echo "start minikube with docker driver"
sleep 5






# Binary Download
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Binary install
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Add user to docker user group
sudo usermod -aG docker $USER && newgrp docker

# Start the MiniKube with limited memory and with docker driver
minikube start --memory=1959mb --driver=docker

# Set driver docker default to docker driver
minikube config set driver docker


# Machine for k8s is now called default

echo "kubectl is now configured to use "minikube" cluster and "default" namespace by default"

# Letting iptables see bridged traffic

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system