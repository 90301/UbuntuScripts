docker run  -d -p 8200:8200 \
    --mount type=volume,source=jenkins_home,target=/jenkins \
    --mount type=volume,source=backups,target=/backups \
    --name styleconnect-dupliciti styleconnect-dupliciti