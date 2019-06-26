cd ./dupliciti

source  ./vars.sh

docker build . -t $CONTAINER_NAME -f ./Dockerfile

./runDocker.sh

cd ../
# -P [HOST]:[CONTAINER]