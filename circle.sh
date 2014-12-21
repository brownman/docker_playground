#!/usr/bin/env bash

################# anchor
dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"

permit(){
  chmod +x *.sh . -R
}

set_env(){
  permit
}
test_all(){
  commander "$file_test"
}


steps(){
  set_env
  test_all
}


steps
