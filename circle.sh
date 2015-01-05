#!/usr/bin/env bash
set -u
#set +e 
################# trap errors
trap_err(){
  echo 1>&2 "_____ $FUNCNAME ______"
  echo 1>&2 `caller`
}
#################
permit(){
  chmod +x *.sh . -R
}

set_env(){
 # file_input=$dir_root/.test
 # file_test=$( head -1 $file_input )
 # test -f $file_test || { echo 1>&2 ERR no such file $file_test; exit 1; }

  source $dir_root/config.cfg || { echo 1>&2 err sourcing .cfg files; exit 1; }
}


ensure1(){
  ensure disk_space
  ensure containers_not_running
}

test_something(){
  echo
  echo 1>&2 the user of this ENV is:
  env | grep USER
  echo
}
 
test_one(){
commander cd $dir_container
#THIS DIR CAN BE IN OTHER REPO WHICH PULL THIS REPO
commander chmod +x ./wrap.sh
commander ./wrap.sh
}

steps(){
  test_something
  clear
  permit
  set_env
  ensure1
  test_one
}

trap trap_err ERR
################# anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
dir_container="${1:-$dir_root/example}"
test -d $dir_container
steps $dir_container
