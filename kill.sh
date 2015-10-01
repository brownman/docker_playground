#!/usr/bin/env bash
set -u
set -e
export dir_root=$PWD
source $dir_root/source.cfg
#commander ./SH/DOCKER/rm_containers.sh
commander ./SH/DOCKER/kill.sh
