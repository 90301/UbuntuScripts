#!/bin/bash

#################################################
#
# Checks
#
#################################################

#
# Check to run as root
#
if [ "$(id -u)" -ne 0 ]; then
   echo "This script need to be run as root." >&2
   exit 1
fi


#
# Check to run on Ubuntu
#
check_ubuntu="python -mplatform | grep -qi Ubuntu"

if [ "$check_ubuntu" == "Ubuntu" ]; then
    echo "This script only runs on Ubuntu." >&2
    exit 1
fi

#################################################
#
# Variables
#
#################################################


#################################################
#
# Functions
#
#################################################


function announce {
	>&2 echo -n "$1"
}

function check_fail {
	if [[ $1 -ne 0 ]]; then
		>&2 echo "FAIL!"
		exit 1
	else
		>&2 echo "OK!"
	fi
}

#################################################
#
# Docker setup
#
#################################################

#
# Install docker dependencies
#
announce "Install docker dependencies..."
apt install apt-transport-https ca-certificates curl gnupg-agent \
software-properties-common -y
check_fail $?

#
# Import gpg key and add repo
#
announce "Import GPG key and repo for docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
check_fail $?

#
# Install docker
#
announce "Installing docker ce..."
apt update 
apt install docker-ce -y
check_fail $?

#
# Initialize docker swarm
#
announce "Setting up docker swarm..."
docker swarm init
check_fail $?

#
# Prompt for user name to add to docker group
#
announce "Adding user to Docker group..."
echo "Type username to add to Docker group: "
read -r username
usermod -a -G docker "$username"
echo "Please logout and then back to enable this."

#################################################
#
# Docker Compose setup
#
#################################################

#
# Download and install docker compose
#
announce "Downloading and install docker compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
check_fail $?