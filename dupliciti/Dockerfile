FROM duplicati/duplicati
ARG BACKUPS_FOLDER="/backups"
ARG JENKINS_HOME="/jenkins"
ARG MYSQL_FOLDER="/mysql"

ENV MYSQL_MAJOR 8.0
ENV MYSQL_VERSION 8.0.16-2debian9

USER root
VOLUME $BACKUPS_FOLDER
VOLUME $JENKINS_HOME
VOLUME $MYSQL_FOLDER
RUN cd ~/;pwd
RUN apt-get update
RUN apt-get install -y mysql-community-client="${MYSQL_VERSION}"