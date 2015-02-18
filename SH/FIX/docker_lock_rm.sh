sudo cat /var/run/docker.pid | xargs kill
sudo pidof docker | xargs kill
sudo mv /var/run/docker.pid /tmp
