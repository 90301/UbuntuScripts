FROM jenkins/jenkins:lts
USER root
VOLUME [ "/jars" ]
RUN mkdir -p $JENKINS_HOME \
  && chown ${uid}:${gid} $JENKINS_HOME \
  && groupadd -g ${gid} ${group} \
  && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
RUN apt-get update
RUN apt-get install -y maven
USER jenkins