#!/bin/bash

clear
num=$#
cmd_start="$@"


pushd `dirname $0` >/dev/null
export dir_root=$PWD
echo dir_root: $dir_root
source $dir_root/source.cfg


test $num -ne 0 || { exit 0; }
echo "cmd: $cmd_start"
eval "$cmd_start"
popd >/dev/null
