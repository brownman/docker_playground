rm_all_running_containers(){
#Take out the garbage
#Here is how to delete all stopped containers (useful if you need to re-run named containers):
sudo docker rm -fv $(sudo docker ps -a -q)
}

rm_all_running_containers

