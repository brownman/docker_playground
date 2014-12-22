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

test_one(){
  eval "$file_test"
}

#use file_wrap to customize docker-cli
file_wrap="${1:-$dir_root/example/wrap.sh}" 
file_container="${2:-$dir_root/example/Dockerfile}" 
file_test="${3:-$dir_root/example/test.sh}"
steps 
commander "$file_wrap" "$file_container" "$file_test"
