#!/usr/bin/env bash
set -u
export dir_root=$PWD
source $dir_root/source.cfg
run_tests $dir_root/tests/gitlab_and_selenium.sh
#run_webapp_deamon
