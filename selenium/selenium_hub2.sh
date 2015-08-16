name=$alias_selenium
env_videos=''; #'-e VIDEO=true'
test /tmp/videos || ( mkdir -p /tmp/videos )
volume_videos="-v /tmp/videos:/videos"
docker run $env_videos $volume_videos --privileged -d --name=$name -p=0.0.0.0:4444:24444 -p=0.0.0.0:5920:25900 \
    -p=0.0.0.0:2222:22222 -p=0.0.0.0:6080:26080 \
    -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 \
    -e VNC_PASSWORD=ofer \
    elgalu/selenium:2.47.1d
#-e SSH_AUTH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \

