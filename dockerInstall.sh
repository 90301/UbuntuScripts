#!/bin/sh
cd "$(dirname "$0")"

# Docker Version

apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update

apt install docker-ce docker-ce-cli containerd.io

# Install Vagrant

apt install vagrant

cd jenkins
vagrant up