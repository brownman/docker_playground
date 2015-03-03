#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
file_src='../gitlab_linnovate.cfg'
test -f $file_src && { source $file_src; } || true
source $dir_root/source.cfg
commander ./SH/DOCKER/kill.sh
commander run_mongo
commander run_selenium
sleep 1
#run_tests
commander run_webapp_deamon
commander ./SH/DOCKER/attach.sh
