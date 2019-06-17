docker run  -d -p 8081:8080 \
    --mount type=volume,source=jenkins_home,target=/var/jenkins_home \
    --mount type=volume,source=jars,target=/jars \
    --name styleconnect-jenkins styleconnect-jenkins