set -u
set -x
set -e
export dir_root=$PWD


source source.cfg

source ../private.conf

./kill.sh
#source ./tests/hadera.sh
run_mysql
run_hadera
tests/exec.sh
