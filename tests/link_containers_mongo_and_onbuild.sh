#!/bin/bash
set -u
clear
set_env(){
  source $dir_root/CFG/helper.cfg
  source $dir_root/CFG/vars.cfg
}


#cmd_app="sudo docker run -v /data:/data --name $alias_mongo -d $CONTAINER_DB $cmd_mongo"
container_mongo(){
  echo validating existance of local dir: /data/db
  ( test -d /data/db ) || ( sudo mkdir -p /data/db )
  #ensure mongo container is running
  ( commander "$cmd_validate_running_container" ) || ( commander run_mongo_start )
  commander "$validate_mongo_container_up" || { trace "[ERROR] failed launching mongo contirunning container"; }
}

container_app(){
  commander run_mongo_link
}


linking(){ 
  container_mongo && container_app
}




steps(){
  set_env
  ################ run 2 containers: mongo + webapp
  ################ Mongo should be available in Webapp: validate bounding by inspecting /etc/host on the web-container
  linking
  ensure1
}


steps

