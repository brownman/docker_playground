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

export dir_root=$( where_am_i $0 )
echo 1>&2 dir_root: $dir_root

source $dir_root/source.cfg
#CRONTAB/config.cfg
$dir_root/CRONTAB/wall.sh 'brownman/onbuild'
