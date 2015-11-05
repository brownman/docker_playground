source ../config.cfg
./SH/DOCKER/rm_containers.sh 

#!/usr/bin/env bash
commander "rm -rf /tmp_docker2/*.* &>/dev/null"
commander "rm -rf /tmp_docker/*.* &>/dev/null"
test -f /tmp/commands && ( rm /tmp/commands )
set -u
set -e
export dir_root=$PWD
file_src='../gitlab_linnovate.conf'
test -f $file_src && { source $file_src; } || { echo file not found: $file_src; sleep 5; true; }
file_src='../config.cfg'
test -f $file_src && { source $file_src; } || { echo file not found: $file_src; sleep 5; true; }
source $dir_root/source.cfg
commander ./SH/DOCKER/kill.sh

#commander run_mongo

#commander ./selenium/selenium_hub.sh

#commander run_selenium
#

commander ./SH/selenium/selenium_hub2.sh
#sleep 1
#commander run_webapp_deamon

commander run_gitlab_multi_runner
(commander ./SH/DOCKER/attach.sh &)&

commander cd /tmp; 
commander python3 -m http.server 8000 &
