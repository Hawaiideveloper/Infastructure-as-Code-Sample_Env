#!/bin/bash

# Check for VirtualBox and Vagrant
if ! command -v virtualbox &> /dev/null; then
    echo "VirtualBox is not installed. Install it first."
    exit 1
fi

if ! command -v vagrant &> /dev/null; then
    echo "Vagrant is not installed. Install it first."
    exit 1
fi

# Add the Vagrant Box
vagrant box add ubuntu/bionic64

# Initialize Vagrant project
mkdir -p ad-controller && cd ad-controller
vagrant init ubuntu/bionic64

# Configure Vagrantfile
cat <<EOL > Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y samba krb5-user krb5-config winbind smbclient
  SHELL
end
EOL

# Create .env file
cat <<EOL > .env
# Active Directory Configurations
DOMAIN_NAME=mydomain.local
NETBIOS_NAME=MYDOMAIN
ADMIN_PASSWORD=StrongPassword123!
EOL

# Start and Provision VM
vagrant up

echo "VM is up and provisioned. Please continue with Active Directory setup."
