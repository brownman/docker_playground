


cmd0='/containers/75915b3aef6f43a903b07d5f183c682082e51321453937ac3b6c52a79d06ede6/json?'
#cmd_api=${@:-'/images/json'}
cmd_api=$cmd0


echo -e "GET $cmd_api HTTP/1.0\r\n" | nc -U /var/run/docker.sock
echo 
echo \$cmd_api: $cmd_api
