#!/bin/sh

#setupCert
BASE_DIR="/usr/share/ca-certificates/"
CERT_NAME=
# Update /etc/ca-certificates.conf
echo 'c1.cer' >> '/etc/ca-certificates.conf'

sudo cp ./c1.cer $BASE_DIR/c1.cer
sudo chmod +rwx $BASE_DIR/c1.cer
sudo update-ca-certificates