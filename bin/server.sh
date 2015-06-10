#!/bin/sh
echo "-------------------------------------------------"
echo "Hosting dea : `curl -s http://ip.kumauta.com`"
echo "Listen port : ${PORT}"
echo "Current dir : `pwd`"
echo "-------------------------------------------------"
export JAVA_HOME=/home/vcap/app/jre
export PATH=/home/vcap/app/jre/bin:${PATH}
java -version

cat resin/conf/resin.properties | sed "s/8080/${PORT}/g" > /tmp/resin.properties
mv /tmp/resin.properties resin/conf/resin.properties
echo "-------------------------------------------------"

resin/bin/resin.sh console

#exec perl http2.pl $PORT
