cd ./mysql

docker build . -t styleconnect-mysql -f ./Dockerfile
./runDocker.sh
cd ../
# -P [HOST]:[CONTAINER]