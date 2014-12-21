#!/usr/bin/env bash
set -x
set -u
set +e 
trap_err(){
echo `caller`
}
trap trap_err ERR
################# anchor
export dir_root=$( cd `dirname $0`; echo $PWD )
echo 1>&2 "[dir_root] $dir_root"

permit(){
  chmod +x *.sh . -R
}

set_env(){
permit
file_input=$dir_root/.test
test -v file_test || { file_test=$( head -1 $file_input ); }
}
test_all(){
eval "$file_test"
}

ensure1(){
test -f $file_test || { echo 1>&2 ERR no such file $file_test; exit 1; }
}

steps(){
 set_env
 ensure1
 test_all
}


steps
