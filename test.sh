export dir_root=$(cd `dirname $0`; pwd)
source $dir_root/config.cfg
$dir_root/tests/link_containers_mongo_and_onbuild.sh
