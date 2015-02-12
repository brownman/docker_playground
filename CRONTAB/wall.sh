set -u

wall1(){
echo "$@" | wall
}

container_name="$1"

docker pull $container_name && { date > /tmp/date; wall1 container $container_name upgraded! ; } || { wall1 container $container_name is already up-to-date  ;  }
