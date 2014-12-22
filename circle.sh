#!/usr/bin/env bash
set -u
set +e 
################# trap errors
trap_err(){
echo `caller`
}
trap trap_err ERR
################# anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
#################
permit(){
chmod +x *.sh . -R
}
cleanup(){
$dir_root/DOCKER/rm_containers.sh
}
set_env(){
file_input=$dir_root/.test
file_test=$( head -1 $file_input )
source $dir_root/config.cfg
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
permit
set_env
ensure1
test_all
}
steps
