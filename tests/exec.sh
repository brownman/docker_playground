set -e 
set -u
dir_root=$PWD
source $dir_root/source.cfg
#echo docker exec -it drupal1 bash
ping_host_mysql(){
    cmd1="ping -c 3 $alias_mysql"
cmd="${@-$cmd1}"
commander docker exec  drupal1 $cmd
}

connect_db_mysql(){
    #https://coreos.com/products/enterprise-registry/docs/latest/mysql-container.html
   #cmd_connect_mysql='sh -c exec mysql -h"\$MYSQL_PORT_3306_TCP_ADDR" -P"\$MYSQL_PORT_3306_TCP_PORT" -u"$user_mysql" -p"$password_mysql"'

   cmd_connect_mysql1="sh -c 'exec mysql -u ${user_mysql} -p${password_mysql} ${db_name_mysql}'"
   cmd_connect_mysql2="sh -c 'exec mysql -u ${user_mysql} -p${password_mysql}SOME_ERR ${db_name_mysql}'"


#-i: input redirection
test -f $file_db_dump && {  commander "docker exec -i $alias_mysql mysql -u $user_mysql -p${password_mysql} $db_name_mysql < $file_db_dump"; }
#docker exec -i dump mysql -uroot -proot < dump.sql



#trace expect success
 #  commander "docker exec $alias_mysql $cmd_connect_mysql1"
#trace expect failure
 #  commander "docker exec $alias_mysql $cmd_connect_mysql2"



   
}

ping_host_mysql
connect_db_mysql
