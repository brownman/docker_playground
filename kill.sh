#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
file_src='../gitlab_linnovate.conf'
test -f $file_src && { source $file_src; } || { echo file not found: $file_src; sleep 5; true; }
file_src='../config.cfg'
test -f $file_src && { source $file_src; } || { echo file not found: $file_src; sleep 5; true; }
source $dir_root/source.cfg


commander ./SH/DOCKER/rm_containers.sh
commander ./SH/DOCKER/kill.sh


exit
