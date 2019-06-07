cd ./jenkins
docker build . -t styleconnect-jenkins -f ./Dockerfile
docker run  -d -p 8081:8080 -v jenkins_home:/jenkins_home -v jars:/jars --name styleconnect-jenkins styleconnect-jenkins
cd ../
# -P [HOST]:[CONTAINER]