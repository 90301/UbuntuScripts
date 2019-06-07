FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN apt-get install -y maven
RUN chmod a+rwx -R /var/tomcat/
USER jenkins