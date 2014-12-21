

######################################### RUN / LINK  -2-  CONTAINERS
run_mongo_start(){
docker run --link $alias_mongo:db $volume_extra $flag_docker $opts_gitlab $CONTAINER_APP bash -c "'$cmd_validate_env_mongo'"
}

run_mongo_link(){
docker run $volume_data $flag_ports -d --name $alias_mongo $CONTAINER_DB mongod $flag_mongo
}

run_mongo_start && run_mongo_link
