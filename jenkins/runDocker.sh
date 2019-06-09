mkdir /jenkins_home/
mkdir /jars/
docker run  -d -p 8081:8080 \
    --mount source=/jenkins_home,target=/var/jenkins_home \
    --mount source=/jars,target=/jars \
    --name styleconnect-jenkins styleconnect-jenkins