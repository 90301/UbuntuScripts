docker run  -it -p 3306:3306 \
    --mount type=volume,source=mysql,target=/var/lib/mysql \
    --name styleconnect-mysql styleconnect-mysql