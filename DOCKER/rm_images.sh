rm_all_images(){
sudo docker rmi $(sudo docker images | grep "^<none>" | awk '{print $3}')
}

rm_all_images

