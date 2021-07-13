#!/bin/bash




echo " please see my issue that explains this file's existence"
echo "https://github.com/Hawaiideveloper/Infastructure-as-Code-Sample_Env/issues/57"


#!/bin/bash

echo "These scripts will prepare ubuntu to run Kubernetes"






#To install using script


sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install curl -y
sudo apt-get install apt-transport-https

sudo apt install virtualbox virtualbox-ext-pack

echo "provided you agreed to everything"
echo " you will now be redirected to minikube installation"

wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube

sudo chmod 755 /usr/local/bin/minikube
minikube version

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version -o json

#minikube start

#kubectl config view
#kubectl cluster-info

#kubectl get nodes
#kubectl get pod

#minikube ssh

#exit

#minikube stop
#minikube status
#minikube delete
#minikube addons list
#minikube dashboard
#minikube dashboard --url



# If you want a dev box created using homebrew please see below
# the following lines are experimental and should not be used, and only used by experience personnel 


# To Install Homebrew uncomment next line:  (yes Linux has homebrew now)
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# To install minikube with homebrew uncomment the next line and do the following ....
# Do not uncomment for production sytems
