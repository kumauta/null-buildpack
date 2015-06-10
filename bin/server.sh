#!/bin/sh
echo "-------------------------------------------------"
echo "Hosting dea : `curl -s http://ip.kumauta.com`"
echo ""
echo "-------------------------------------------------"
echo "Listen port : ${PORT}"
echo "-------------------------------------------------"
pwd
./jre/bin/java -version
echo "-------------------------------------------------"
export JAVA_HOME=/home/vcap/app/jre/bin
export PATH=/home/vcap/app/jre/bin:${PATH}
java -version
echo "-------------------------------------------------"

exec perl http2.pl $PORT
