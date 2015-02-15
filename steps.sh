#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
source $dir_root/source.cfg
./DOCKER/kill.sh
test -d /extra || { sudo mkdir -p /extra; cd extra; git clone https://github.com/brownman/json_wire_protocol.git; }
run_selenium
sleep 1
run_tests
#run_webapp_deamon
