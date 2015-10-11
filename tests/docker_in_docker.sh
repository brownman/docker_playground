#container=ubuntu
container=brownman/onbuild

cmd_apparmor='-v /usr/lib/x86_64-linux-gnu/libapparmor.so.1.1.0:/lib/x86_64-linux-gnu/libapparmor.so.1'
commander docker run --privileged=true $cmd_apparmor -v /var/run/docker.sock:/var/run/docker.sock \
           -v $(which docker):/usr/bin/docker \
           -ti $container bash


