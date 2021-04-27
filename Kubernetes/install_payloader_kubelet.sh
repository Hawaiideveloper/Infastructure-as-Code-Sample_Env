#!/bin/bash
## Generic installation on all nodes

sysctl -w net.ipv4.ip_forward=1

# Creating / Changing  net.ipv4.ip_forward=1 to net.ipv4.ip_forward=1 globally in document called systctl.conf
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf 


# Load in sysctl settings from the file specified or /etc/sysctl.conf if none given. Specifying - as filename means reading data from standard input.
sudo sysctl -p /etc/sysctl.conf

# disable, respectively, devices and files for paging and swapping.
swapoff -a

sed -i '2s/^/#/' /etc/fstab 

apt-get update
apt-get update && apt-get install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
apt-get update && apt-get install -y docker-ce

cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

mkdir -p /etc/systemd/system/docker.service.d
systemctl daemon-reload
systemctl restart docker
systemctl enable docker

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt install kubernetes-cni -y # not in documentation needed for updates
apt-get install kubelet kubeadm kubectl -y
apt-mark hold kubelet kubeadm kubectl
systemctl daemon-reload
systemctl restart kubelet

## Create Default Audit Policy

mkdir -p /etc/kubernetes
cat > /etc/kubernetes/audit-policy.yaml <<EOF
apiVersion: audit.k8s.io/v1beta1
kind: Policy
rules:
- level: Metadata
EOF

# folder to save audit logs
mkdir -p /var/log/kubernetes/audit

## Install NFS Client Drivers
sudo apt-get update
sudo apt-get install nfs-common
