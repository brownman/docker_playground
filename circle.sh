#!/usr/bin/env bash
set -u
#set +e 
################# trap errors
trap_err(){
  echo 1>&2 "_____ $FUNCNAME ______"
  echo 1>&2 `caller`
}
trap trap_err ERR
################# anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"
#################
permit(){
  chmod +x *.sh . -R
}

set_env(){
  file_input=$dir_root/.test
  file_test=$( head -1 $file_input )
  source $dir_root/config.cfg || { echo 1>&2 err sourcing .cfg files; exit 1; }
}


ensure1(){
  ensure disk_space
  ensure containers_not_running
  test -f $file_test || { echo 1>&2 ERR no such file $file_test; exit 1; }
}

test_something(){
  echo
  echo 1>&2 the user of this ENV is:
  env | grep USER
  echo
}

test_one(){
  commander "$file_wrap" "$file_container" "$file_test"
}


steps(){
  test_something
  clear
  permit
  set_env
  ensure1
  test_one
}


#use file_wrap to customize docker-cli
set_files(){
commander cd $dir_container
#THIS DIR CAN BE IN OTHER REPO WHICH PULL THIS REPO
commander chmod +x ./wrap.sh
commander ./wrap.sh
}
steps 
