#!/bin/bash
set -u

set_env(){
  source $dir_root/CFG/helper.cfg
  source $dir_root/CFG/vars.cfg
  source $dir_root/CFG/container.cfg
  source $dir_root/CFG/validate.cfg
}


#cmd_app="sudo docker run -v /data:/data --name $alias_mongo -d $CONTAINER_DB $cmd_mongo"
container_sel(){
run_sel
}

container_mongo(){
  #ensure mongo container is running
  run_mongo
#  commander "$cmd_validate_mongo_container_up" || { trace "[ERROR] failed launching mongo contirunning container"; }
}

container_selenium(){
  #ensure mongo container is running
  run_selenium
#  commander "$cmd_validate_mongo_container_up" || { trace "[ERROR] failed launching mongo contirunning container"; }
}


container_app(){
  commander_exit run_webapp
}


linking_mongo(){ 
  container_mongo && container_app
}


linking_sel(){
container_sel 

container_app
}
linking(){
linking_sel
}
steps(){
  clear
  set_env
  ################ run 2 containers: mongo + webapp
  ################ Mongo should be available in Webapp: validate bounding by inspecting /etc/host on the web-container
  linking
}


steps

