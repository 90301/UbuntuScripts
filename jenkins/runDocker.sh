mkdir /jenkins_home/
mkdir /jars/
docker run  -d -p 8081:8080 -v /jenkins_home:/var/jenkins_home -v /jars:/jars --name styleconnect-jenkins styleconnect-jenkins