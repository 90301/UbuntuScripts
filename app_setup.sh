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

DOCKER_STACK_NAME="app-stack"

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

function start_stack {

	#
	# Prompt for jenkins username and password
	#
	announce "Prompt for jenkins username and password if they dont exist..."
	if  ! docker secret ls | grep -q 'jenkins-user' ; then
	   echo "Type username for Jenkins: "
   	   read -r jenkinsuser
   	   echo "$jenkinsuser" | docker secret create jenkins-user -
	fi

	if  ! docker secret ls | grep -q 'jenkins-pass' ; then
   	   echo "Type password for Jenkins: "
       read -r jenkinspass
       echo "$jenkinspass" | docker secret create jenkins-pass -
	fi
	check_fail $?

	#
	# Run Docker compose
	#
	announce "Running docker compose..."
	docker-compose build
	check_fail $?

	docker stack deploy -c docker-compose.yml $DOCKER_STACK_NAME
}

function stop_stack {
	docker stack rm $DOCKER_STACK_NAME
}

function check_stack_services {
	docker stack services $DOCKER_STACK_NAME
}

function check_stack_status {
	docker stack ps $DOCKER_STACK_NAME
}

#################################################
#
# Use Docker Compose to run apps
#
#################################################

#
# Configure app stack
#
announce "Bringing up app stack..."

case "$1" in
  start)
    start_stack
    ;;
  stop)
    stop_stack
    ;;
  status)
    check_stack_status
    ;;
  services)
    check_stack_services
    ;;
  restart)
    stop_stack
	start_stack
	;;
  *)
    echo "Usage: $0 {start|stop|status|services|restart}"
esac
check_fail $?