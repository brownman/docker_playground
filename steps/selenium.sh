#!/usr/bin/env bash
set -u
export dir_root=$PWD
source $dir_root/source.cfg
run_selenium
sleep 1
./DETECT/selenium_alias.sh
