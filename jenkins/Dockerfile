FROM jenkins/jenkins:lts
ARG JARS_FOLDER="/jars"
USER root
VOLUME [ JARS_FOLDER ]
RUN echo "${USER} ${group} ${gid} ${uid}"
RUN mkdir -p ${JARS_FOLDER} \
  && chown ${uid}:${gid} ${JARS_FOLDER}
RUN apt-get update
RUN apt-get install -y maven

USER jenkins