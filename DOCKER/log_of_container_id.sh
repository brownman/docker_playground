clear
CONTAINER_ID=$( sudo docker ps | cut -d' ' -f1 | tail -1 )
sudo docker logs --timestamps=true --follow=true --tail="all" $CONTAINER_ID
