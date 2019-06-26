cd ./dupliciti

docker build . -t styleconnect-dupliciti -f ./Dockerfile
./runDocker.sh
cd ../
# -P [HOST]:[CONTAINER]