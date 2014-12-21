#!/usr/bin/env bash
set -u
set +e 
trap_err(){
echo `caller`
}
trap trap_err ERR
################# anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"

cleanup(){
commander $dir_root/DOCKER/rm_containers.sh
}

permit(){
  chmod +x *.sh . -R
}

set_env(){
permit
file_input=$dir_root/.test
file_test=$( head -1 $file_input )
source CFG/vars.cfg
source CFG/helper.cfg
source CFG/container.cfg
source CFG/validate.cfg
}

test_all(){
eval "$file_test"
}

ensure1(){
 validate_space
 cleanup
test -f $file_test || { echo 1>&2 ERR no such file $file_test; exit 1; }
}

steps(){
clear
 set_env
 ensure1
test_all
}


steps
