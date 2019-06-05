#!/bin/sh

#setupCert
BASE_DIR="/usr/local/share/ca-certificates/"
sudo mkdir $BASE_DIR/dc
sudo chmod 755 $BASE_DIR/dc
cp ./c1.cer $BASE_DIR/dc/c1.cer
sudo chmod 644 $BASE_DIR/dc/c1.cer
sudo update-ca-certificates