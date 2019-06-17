docker stop styleconnect-jenkins
docker stop styleconnect-tomcat


docker volume rm jars

./jenkins/removeDocker.sh
./jenkins/buildAndRunDocker.sh
./tomcat/buildAndRunDocker.sh