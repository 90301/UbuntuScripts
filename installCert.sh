#!/bin/sh

#setupCert
BASE_DIR="/usr/local/share/ca-certificates/"

sudo cp ./c1.cer $BASE_DIR/c1.cer
sudo chmod 644 $BASE_DIR/c1.cer
sudo update-ca-certificates