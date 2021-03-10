#!/usr/bin/env bash

sudo apt-get update

DEVOPSGROUP="devopsteam"
USERNAME="siva"
PASSWORD="secret123"

groupadd ${DEVOPSGROUP}
echo "%${DEVOPSGROUP} ALL=(ALL:ALL) ALL" >> /etc/sudoers
useradd -m -p $(openssl passwd -1 ${PASSWORD}) -s /bin/bash -G ${DEVOPSGROUP} ${USERNAME}

# Install docker
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common --yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io --yes
sudo usermod -aG docker ${USERNAME}

# Install ansible
sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible --yes

# Install openjdk-11-jdk
sudo apt-get update
sudo apt-get install openjdk-11-jdk --yes
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> "$HOME/.bashrc"
