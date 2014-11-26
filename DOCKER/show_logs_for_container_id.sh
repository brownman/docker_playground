clear
CONTAINER_ID=$( sudo docker ps | cut -d' ' -f1 | tail -1 )
sudo docker logs $CONTAINER_ID
