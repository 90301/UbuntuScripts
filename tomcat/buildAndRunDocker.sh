cd ./tomcat

docker build . -t styleconnect-tomcat -f ./Dockerfile
./runDocker.sh
cd ../