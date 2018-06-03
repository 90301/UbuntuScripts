#!/bin/bash
# your code goes here

sudo add-apt-repository ppa:webupd8team/java

sudo apt-get update

sudo apt-get install oracle-java8-installer -y

sudo apt-get install mysql-server -y

wget http://www.trieuvan.com/apache/tomcat/tomcat-9/v9.0.8/bin/apache-tomcat-9.0.8.tar.gz

tar -xzvf apache-tomcat-9.0.8.tar.gz
mv apache-tomcat-9.0.8/ ~/tomcat/
rm ./apache-tomcat-9.0.8.tar.gz

sudo cp ./tomcat9 /etc/init.d/tomcat9

chmod 755 /etc/init.d/tomcat9
update-rc.d tomcat9 defaults

sudo apt-get install ssh -y
