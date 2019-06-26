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

# --- Install MYSQL for backup purposes ---

#RUN apt-get update && apt-get install -y --no-install-recommends \
# for MYSQL_RANDOM_ROOT_PASSWORD
#		pwgen \
# for mysql_ssl_rsa_setup
#		openssl \
# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
#		perl \
#	&& rm -rf /var/lib/apt/lists/*

RUN set -ex; \
# gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
	key='A4A9406876FCBD3C456770C88C718D3B5072E1F5'; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
	gpg --batch --export "$key" > /etc/apt/trusted.gpg.d/mysql.gpg; \
	gpgconf --kill all; \
	rm -rf "$GNUPGHOME"; \
	apt-key list > /dev/null

RUN echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list
RUN apt-get update
RUN apt-get install -y mysql-community-client="${MYSQL_VERSION}"