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
# Ubuntu setup
#
#################################################

#
# update packages index
#
announce "Updating package index..."
apt update
check_fail $?

#################################################
#
# Ubuntu hardening
#
#################################################

#
# Install and configure fail2ban
#
announce "Installing fail2ban..."
apt install fail2ban -y
check_fail $?

announce "Create fail2ban log directory..."
mkdir -p /var/log/fail2ban
mkdir -p /etc/systemd/system/fail2ban.service.d/
check_fail $?

announce "Copy over fail2ban config files..."
cp fail2ban/fail2ban.local /etc/fail2ban/fail2ban.local
cp fail2ban/jail.local /etc/fail2ban/jail.d/jail.local
check_fail $?

announce "Copy over fail2ban systemd override..."
cp fail2ban/override.conf /etc/systemd/system/fail2ban.service.d/override.conf
systemctl daemon-reload
systemctl restart fail2ban.service
check_fail $?

#
# Configure firewall
#
announce "Setting up firewall..."
ufw default deny
ufw limit ssh
y | ufw enable
check_fail $?

#
# Configure ssh
#
announce "Copy sshd config..."
cp sshd/sshd_config /etc/ssh/sshd_config
systemctl restart sshd
check_fail $?

#
# Install and configure auditd
#
announce "Installing auditd..."
apt install auditd -y
cp auditd/audit.rules /etc/audit/rules.d/audit.rules
systemctl restart auditd
check_fail $?