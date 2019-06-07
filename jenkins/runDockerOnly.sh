cd ./jenkins
docker run  -d -p 8081:8080 -v jenkins_home:/jenkins_home --name styleconnect-jenkins ./DockerFile
cd ../
# -P [HOST]:[CONTAINER]