    docker run -it --net host --cpuset 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix:0 -v /home/someone1/Downloads:/root/Downloads -v /home/someone1/.config/google-chrome/:/data -v /dev/snd:/dev/snd --privileged --name chrome2 jess/chrome 