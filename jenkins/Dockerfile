FROM jenkins/jenkins:lts
ARG JARS_FOLDER="/jars"
USER root
VOLUME [ JARS_FOLDER ]
RUN echo "${USER} ${group} ${gid} ${uid}"
RUN mkdir -p ${JARS_FOLDER} \
  && chown ${uid}:${gid} ${JARS_FOLDER} \
   && useradd -d "$JARS_FOLDER" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
RUN apt-get update
RUN apt-get install -y maven

USER jenkins