id=$( docker inspect $id | grep $id | grep Id | cut -d':' -f2 | xargs | cut -d',' -f1 )


cmd0="/containers/$id/json?"
#cmd_api=${@:-'/images/json'}
cmd_api="$cmd0"


echo -e "GET $cmd_api HTTP/1.0\r\n" | nc -U /var/run/docker.sock
echo 
echo \$cmd_api: $cmd_api
