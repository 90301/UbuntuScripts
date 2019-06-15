#!/bin/bash/
echo "Set the mysql root password"
read msqlpass

docker run  -it -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=$msqlpass \
    --mount type=volume,source=mysql,target=/var/lib/mysql \
    --name styleconnect-mysql styleconnect-mysql