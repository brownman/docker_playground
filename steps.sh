#!/usr/bin/env bash

export dir_root=$PWD
source $dir_root/source.cfg
./DOCKER/kill.sh
./DETECT/selenium_run.sh
sleep 1
./DETECT/selenium_alias.sh
run_webapp_deamon
