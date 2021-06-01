#!/bin/bash
# cloned from https://github.com/globalbao/terraform-azurerm-ansible-linux-vm

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
sudo ansible-galaxy collection install azure.azcollection
sudo pip3 install pywinrm[credssp]
sudo pip3 install msrest msrestazure
sudo pip3 install 'ansible[azure]'

#create folder structure and secure
sudo groupadd grpsecansadmin
usermod -a -G grpsecansadmin localadmin
usermod -a -G grpsecansadmin root
sudo mkdir /etc/ansible/group_vars
sudo chgrp grpsecansadmin /etc/ansible/group_vars
sudo chmod g+rwx /etc/ansible/group_vars
