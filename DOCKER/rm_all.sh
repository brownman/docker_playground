rm_all_images(){
sudo docker rmi $(sudo docker images | grep "^<none>" | awk '{print $3}')
}

rm_all_running_containers(){
#Take out the garbage
#Here is how to delete all stopped containers (useful if you need to re-run named containers):
sudo docker rm -f $(sudo docker ps -a -q)
}
rm_all_running_containers
rm_all_images
