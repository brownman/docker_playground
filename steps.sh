#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
source $dir_root/source.cfg
./DOCKER/kill.sh
test -d /extra || { echo 'enable repo on /extra'; sudo mkdir -p /extra; git clone --depth 1 https://github.com/brownman/json_wire_protocol.git /extra/json_wire_protocol; } 
run_selenium
sleep 1
run_tests
#run_webapp_deamon
