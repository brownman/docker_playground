    sudo docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs -n1 -I {} docker stop {}
    #sudo docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs -n1 -I {} docker kill {}

    sudo docker ps -a | awk '{print $1}' | grep -v CONTAINER | xargs -n1 -I {} docker rm {}


# str="$( docker ps | awk '{print $1}' |  tail -n +2 )"
# echo "str: $str"
# for item in $str;do
# commander "docker kill $item"
# done

