Create gitlab server


#!/bin/bash

set -e

BASE_DIR="/Users/president/Documents/gitlab/ItsABookingApp.com/itsabookingappDotCom/infrastructure_payloads/gitlabServer/"
VAGRANT_DIR="${BASE_DIR}"

function create_vagrantfile() {
  mkdir -p "$VAGRANT_DIR"
  cat <<EOL > "${VAGRANT_DIR}/Vagrantfile"
Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1804"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "public_network", bridge: "en0"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "$1"
    vb.cpus = $2
  end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl openssh-server ca-certificates postfix
    curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
    apt-get install -y gitlab-ce
    gitlab-ctl reconfigure
  SHELL
end
EOL
}

function destroy_existing_vm() {
  if [ -d "$VAGRANT_DIR" ]; then
    cd "$VAGRANT_DIR"
    vagrant destroy -f || true
  fi
}

function remove_existing_vagrant_dir() {
  rm -rf "$VAGRANT_DIR"
}

function start_vm() {
  cd "$VAGRANT_DIR"
  vagrant up
}

function attempt_start() {
  create_vagrantfile "2048" 1
  ( start_vm ) || {
    echo "Failed to start VM with 2048 MB memory. Trying with 4096 MB memory."
    create_vagrantfile "4096" 2
    destroy_existing_vm
    start_vm
  }
}

remove_existing_vagrant_dir
attempt_start

