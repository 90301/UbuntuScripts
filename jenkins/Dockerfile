FROM jenkins/jenkins:lts

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER root

COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y maven --no-install-recommends && rm -rf /var/cache/apt/*

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt