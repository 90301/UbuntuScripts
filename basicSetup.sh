#!/bin/sh
# your code goes here

TOMCAT_VERSION="9.0.20"

sudo apt install openjdk-8-jdk -y

sudo apt-get install mysql-server -y

wget http://www.trieuvan.com/apache/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

tar -xzvf apache-tomcat-$TOMCAT_VERSION.tar.gz
mv apache-tomcat-$TOMCAT_VERSION/ ~/tomcat/
rm ./apache-tomcat-$TOMCAT_VERSION.tar.gz

sudo cp ./tomcat9 /etc/init.d/tomcat9

chmod 755 /etc/init.d/tomcat9
update-rc.d tomcat9 defaults

sudo apt-get install ssh -y

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y  --allow-unauthenticated
#sed -i 's/original/new/g' file.txt
sed -i 's/8080/8081/g' /etc/default/jenkins