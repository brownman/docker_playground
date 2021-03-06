#https://forums.docker.com/t/command-to-remove-all-unused-images/20
rm_not_tagged(){
docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
}
rm_not_used(){
#docker images -q |xargs docker rmi
docker images | grep '' | awk '{print $3}' | xargs docker rmi
}

rm_all_images(){
local num=${1:-2}
echo skip first columns
docker rmi <<<  docker images | tail  -n +"${num}" | awk '{ print $3; }'
}


rm_not_used
rm_not_tagged
type rm_all_images

