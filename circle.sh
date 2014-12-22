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

set_env(){
  file_input=$dir_root/.test
  file_test=$( head -1 $file_input )
  source $dir_root/config.cfg || { echo 1>&2 err sourcing .cfg files; exit 1; }
}

test_all(){
  eval "$file_test"
}

ensure1(){
  ensure validate_space
  ensure rm_containers
  test -f $file_test || { echo 1>&2 ERR no such file $file_test; exit 1; }
}

test_something(){
  echo
  echo 1>&2 the user of this ENV is:
  env | grep USER
  echo
}

steps(){
  test_something
  clear
  permit
  set_env
  ensure1
}

test -v CONTAINER
test -v file_test
steps "$CONTAINER" "$file_tests"
