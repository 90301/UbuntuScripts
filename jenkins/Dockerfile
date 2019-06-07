FROM jenkins/jenkins:lts
ARG JARS_FOLDER="/jars"
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
USER root
VOLUME $JARS_FOLDER
RUN echo "${USER} ${group} ${gid} ${uid}"
RUN mkdir -p ${JARS_FOLDER} \
  && chown ${uid}:${gid} ${JARS_FOLDER}
RUN apt-get update
RUN apt-get install -y maven

USER jenkins