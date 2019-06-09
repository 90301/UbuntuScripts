cd ./jenkins

docker build . -t styleconnect-jenkins -f ./Dockerfile
./runDocker.sh
cd ../
# -P [HOST]:[CONTAINER]