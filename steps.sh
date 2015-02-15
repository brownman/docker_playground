#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
source $dir_root/source.cfg
./DOCKER/kill.sh
run_selenium
sleep 1
#run_tests
run_webapp_deamon
./DOCKER/attach.sh
