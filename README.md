# UbuntuScripts

## Overview

This is a collection of bash scripts that will setup a Ubuntu 18.04 machine to 
run Docker and Docker Compose. In addition it attempts to harden the machine.

There are three shell scripts `main.sh`, `docker_config.sh`, and `app_setup.sh`.  

The `main.sh` script will harden the Ubuntu machine. The `docker_config.sh` 
script will set up and install Docker, Docker Swarm, and Docker Compose. It will
also prompt for a user to add to the Docker group. The `app_setup.sh` script 
will prompt for the jenkins username and password. It will then run Docker 
Compose and provision the Docker Swarm stack.

## Initial setup
Basic first run install scripts.
```
sudo apt-get install git -y

git clone https://github.com/90301/UbuntuScripts.git
```

## Run Scripts

**NOTE**: These scripts will need to be run as root and will only run on Ubuntu.

First run the `main.sh` script:
`sudo ./main.sh`

Then run the `docker-config.sh` script:
`sudo ./docker-config.sh`

This will prompt for a user to add to the Docker group.

**NOTE**: This script does not need to be be run with sudo.

Run the `app_setup.sh` script:
`./app_setup.sh start`

There are a few more commands that help with Docker Swarm:
```
./app_setup.sh start
This will set credentials if not set already then builds containers and starts 
the stack.

./app_setup.sh stop
This will remove the stack.

./app_setup.sh restart
This will remove and then start the stack.

./app_setup.sh status
This will run docker stack ps STACK.

./app_setup.sh services
This will run docker stack services STACK.

```

This will prompt for the jenkins username and password if they don't already 
exist.
