!#/bin/bash/
echo "Set the mysql root password"
read $password

docker run  -it -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=$password \
    --mount type=volume,source=mysql,target=/var/lib/mysql \
    --name styleconnect-mysql styleconnect-mysql