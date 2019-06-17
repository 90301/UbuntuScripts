docker stop styleconnect-jenkins
docker stop styleconnect-tomcat


docker volume rm jars

./jenkins/buildAndRunDocker.sh
./tomcat/buildAndRunDocker.sh