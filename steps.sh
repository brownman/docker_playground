#!/usr/bin/env bash
commander rm -rf /tmp_docker2/*
commander rm -rf /tmp_docker/*
set -u
set -e
export dir_root=$PWD
file_src='../gitlab_linnovate.conf'
test -f $file_src && { source $file_src; } || { echo file not found: $file_src; sleep 5; true; }
file_src='../config.cfg'
test -f $file_src && { source $file_src; } || { echo file not found: $file_src; sleep 5; true; }
source $dir_root/source.cfg
commander ./SH/DOCKER/kill.sh
commander run_mongo
#commander run_selenium
#
commander ./selenium/selenium_hub.sh
sleep 1
run_tests && {
commander run_webapp_deamon
commander ./SH/DOCKER/attach.sh; }
