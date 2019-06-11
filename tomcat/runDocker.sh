docker run  -d -p 80:8080 \
    --mount type=volume,source=jars,target=/usr/local/tomcat/webapps/ \
    --name styleconnect-tomcat styleconnect-tomcat