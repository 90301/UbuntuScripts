
source  ./vars.sh

docker run  -d -p 8200:8200 \
    --mount type=volume,source=jenkins_home,target=/jenkins \
    --mount type=volume,source=backups,target=/backups \
    --mount type=volume,source=mysql,target=/mysql \
    --mount type=volume,source=duplicatiData,target=/data \
    --name $CONTAINER_NAME $CONTAINER_NAME