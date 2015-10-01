#!/bin/bash
set -u

where_am_i () 
{ 
    local file=${1:-"${BASH_SOURCE[0]}"};
    local rpath=$(readlink -m $file);
    local rcommand=${rpath##*/};
    local str_res=${rpath%/*};
    echo $str_res
}

export dir_root1=$( where_am_i $0 )
echo 1>&2 dir_root1: $dir_root1

source $dir_root1/CFG/config.cfg
#CRONTAB/config.cfg
$dir_root1/SH/wall.sh 'brownman/onbuild'
