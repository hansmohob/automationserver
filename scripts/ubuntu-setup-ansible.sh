#!/bin/bash
# cloned from https://github.com/globalbao/terraform-azurerm-ansible-linux-vm

# Change directory to user home
cd /home/localadmin

# Upgrade all packages that have available updates and remove old ones.
sudo apt-get update
sudo apt upgrade -y
sudo apt autoremove --assume-yes

# Install azcli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install ansible and dependencies
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible --assume-yes
sudo apt install python3-pip --assume-yes
sudo pip3 install pywinrm
sudo ansible-galaxy collection install ansible.windows
sudo ansible-galaxy collection install community.windows
