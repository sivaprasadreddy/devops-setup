#!/usr/bin/env bash

# Install openjdk-11-jdk
sudo apt-get update
sudo apt-get install openjdk-11-jdk --yes
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> "$HOME/.bashrc"

#sudo apt-get update
#sudo apt-get install openjdk-8-jdk openjdk-8-jre
#echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> "$HOME/.bashrc"
