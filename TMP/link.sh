#!/bin/bash 
set -u

commander ./DOCKER/kill.sh
commander docker ps
sleep 4

NAME1=${1:-selenium$(date +%S)}

intro(){
echo which docker image should I pull ?
}

commander(){ 
    local args=($@);
    local cmd="${args[@]}";
    echo 1>&2 cmd: $cmd;
    eval "$cmd" || { echo err cmd; exit 0; }
}
try(){ 
    local args=($@);
    local cmd="${args[@]}";
    echo 1>&2 try: $cmd;
sleep 2
    eval "$cmd"
}


#PRINT HOST ENV
set_env(){
name1=$NAME1
container_base='brownman/onbuild'
host='0.0.0.0'
port=4444
port_vlc=5999
path='wd/hub'
address="$host:$port"
#RUN TESTS
container1='vvoyer/docker-selenium-firefox-chrome'
container2='eperoumalnaik/docker-chrome-selenium'
}

print_info(){
ps fax
netstat -ntlp
env
}

run_host(){
  local container="$1"
  
  commander docker pull $container:latest
  commander docker run --privileged -p $port:$port -d --name $name1 $container # < test.sh &
  docker ps
  
#ACCESS FROM HOST
while true; do  try curl $address/$path/status &>/dev/null && break || { echo waiting for selenium-server; }; sleep 1 ; done
commander curl $address/$path/status
}

run_link(){
#docker run -v /data:/data -p 27017:27017 -p 28017:28017 -d --name mongo_deamon brownman/mongo sh -c 'mongod --rest --httpinterface --smallfiles'
#docker run -p 3000:3000 -p 35729:35729  --link mongo_deamon:db -i brownman/mean bash < test.sh &
echo running tests...
commander docker run -p $port:$port  --link $name1:db -i $container_base bash < test.sh &
}
steps(){
intro
set_env
docker ps | grep selenium || { try run_host $container2; }
#try run_link $container2
}

steps

