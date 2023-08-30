#!/bin/bash

# Check if VirtualBox and Vagrant are installed
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

# Configure Vagrantfile for Bridged Networking
cat <<EOL > Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "public_network", bridge: "en0: inet" # Adjust the interface name if necessary

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y samba krb5-user krb5-config winbind smbclient ufw

    # Enable UFW and allow Samba traffic
    sudo ufw enable
    sudo ufw allow samba
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
