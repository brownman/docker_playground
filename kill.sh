#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
source $dir_root/source.cfg
    sudo docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs -n1 -I {} docker stop {}

    sudo docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs -n1 -I {} docker rm {}

commander ./SH/DOCKER/kill.sh
