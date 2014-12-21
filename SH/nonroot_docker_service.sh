USER=${1:-$USER}

sudo groupadd docker
#Add the connected user "${USER}" to the docker group. Change the user name to match your preferred user.

sudo gpasswd -a ${USER} docker
#Restart the Docker daemon:

sudo service docker restart
#If you are on Ubuntu 14.04 and up use docker.io instead:

sudo service docker.io restart
