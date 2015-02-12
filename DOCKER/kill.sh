str=$( docker ps |  tail -n -1 | awk -F' ' '{print $1}' )
commander "docker kill $str"

