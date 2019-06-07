cd ./jenkins
docker build . -t styleconnect-jenkins -f ./
docker run  -d -p 8081:8080 -v jenkins_home:/jenkins_home --name styleconnect-jenkins styleconnect-jenkins
cd ../
# -P [HOST]:[CONTAINER]