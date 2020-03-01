#!/bin/bash

#################################################
#
# Checks
#
#################################################

#
# Check to run as root
#
# if [ "$(id -u)" -ne 0 ]; then
#    echo "This script need to be run as root." >&2
#    exit 1
# fi


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
# Use Docker Compose to run apps
#
#################################################

#
# Prompt for jenkins username and password
#
announce "Prompt for jenkins username and password..."
echo "Type username for Jenkins: "
read -r jenkinsuser
echo "$jenkinsuser" | docker secret create jenkins-user -
echo "Type password for Jenkins: "
read -r jenkinspass
echo "$jenkinspass" | docker secret create jenkins-pass -
check_fail $?

#
# Run Docker compose
#
announce "Running docker compose..."
docker-compose build
check_fail $?

#
# Start app stack
#
announce "Bringing up app stack..."
docker stack deploy -c docker-compose.yml app-stack
check_fail $?