docker run --privileged --name devstack -it -p 80:80 slimjim2234/docker-devstack 
docker commit devstack 
docker run -it --privileged -p 80:80 slimjim2234/devstack 
