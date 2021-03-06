#!/bin/sh
echo "-------------------------------------------------"
echo "Hosting dea : `curl -s http://ip.kumauta.com`"
echo "Listen port : ${PORT}"
echo "Current dir : `pwd`"
echo "-------------------------------------------------"
export JAVA_HOME=/home/vcap/app/jdk
export PATH=/home/vcap/app/jdk/bin:${PATH}
java -version

cat resin/conf/resin.properties | sed "s/8080/${PORT}/g" > /tmp/resin.properties
mv /tmp/resin.properties resin/conf/resin.properties
echo "-------------------------------------------------"

# start resin
./resin/bin/resin.sh console
