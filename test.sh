#!/bin/bash
set -u






#cmd2="docker run -v /data:/data --name $alias_mongo -d mongo"




CONTAINER_APP='brownman/onbuild' 
#CONTAINER_DB='brownman/mongo'         
CONTAINER_DB='dockerfile/mongodb'

alias_mongo='mongo_deamon'


flag_volume='-v /data:/data'
flag_ports='-p 27017:27017 -p 28017:28017'
flag_docker='-i -t' # --rm'
flag_mongo="--rest --httpinterface --smallfiles"

#validate1="sudo netstat -ntlp | grep mongo"


cmd_netstat='netstat -ntlp | grep mongo'
cmd_validate_mongo_localhost=${1:-$cmd_netstat}
cmd_validate_running_container="sudo docker ps | grep $alias_mongo"



cmd_mongo="docker run $flag_volume $flag_ports -d --name $alias_mongo $CONTAINER_DB mongod $flag_mongo"
cmd_app="docker run --link $alias_mongo:db $flag_docker $CONTAINER_APP bash -c '$cmd_validate_mongo_localhost'"

#cmd_app="sudo docker run -v /data:/data --name $alias_mongo -d $CONTAINER_DB $cmd_mongo"




#sudo docker run -d -P --name "$alias" -v "$vol_from":"$vol_to" "$CONTAINER_APP" "$cmd"
#https://docs.docker.com/examples/running_redis_service/
#sudo docker run --name $alias_mongo -d $CONTAINER_DB

#docker run -v /data:/data --name $name -d mongo

#Create your web application container
#Next we can create a container for our application. We're going to use the -link flag to create a link to the redis container we've just created with an alias of db. This will create a secure tunnel to the redis container and expose the Redis instance running inside that container to only this container.

#sudo mkdir -p /data/db
#docker run -v /data:/data --name mongodb -d mongo
#sudo docker run -d --name db training/postgres
##sudo docker run -d --name db mongodb
#sudo docker run -t -i --rm --link db:db training/webapp /bin/bash
#sudo docker run -t -i --rm --link db:db brownman/nvm /bin/bash -c env 

steps(){
( test -d /data/db ) || ( sudo mkdir -p /data/db )
( commander "$cmd_validate_running_container" ) || ( commander "$cmd_mongo" )
echo 
echo
( commander "$cmd_validate_running_container" ) && ( commander "$cmd_app" )
}

steps
