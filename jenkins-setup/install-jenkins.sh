#!/usr/bin/env bash

WORKDIR="$HOME/apps"
mkdir -p $WORKDIR
cd $WORKDIR
wget https://get.jenkins.io/war-stable/2.263.3/jenkins.war

nohup java -jar jenkins.war --httpPort=9090 > jenkins.log &
echo "$!" > jenkins.pid

