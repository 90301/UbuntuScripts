FROM mysql:latest
ARG BACKUPS_FOLDER="/backups"
USER root
RUN cd ~/;pwd
VOLUME $BACKUPS_FOLDER

# Install cron
RUN apt-get update
RUN apt-get -y install -qq --force-yes cron

COPY backup-cron /etc/cron.d/backup-cron
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/backup-cron

# Apply cron job
RUN crontab /etc/cron.d/backup-cron
CMD ["cron", "-f"]