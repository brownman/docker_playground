set -u
docker stop alias_selenium || true
docker rm alias_selenium || true
#xhost +
#sudo apt-get install xserver-xephyr
#export XE_DISP_NUM=12 SCREEN_WIDTH=2000 SCREEN_HEIGHT=1500
#Xephyr -ac -br -noreset -resizeable \
#        -screen ${SCREEN_WIDTH}x${SCREEN_HEIGHT} :${XE_DISP_NUM}

export XE_DISP_NUM=12 SCREEN_WIDTH=2000 SCREEN_HEIGHT=1500
name=${alias_selenium:-alias_selenium}
env_videos='-e VIDEO=true'
dir_tmp_vid=/tmp/videos1
dir_tmp_vid2=/tmp/videos2

test $dir_tmp_vid || ( mkdir -p $dir_tmp_vid )
test $dir_tmp_vid2 || ( mkdir -p $dir_tmp_vid2 )
volume_videos="-v $dir_tmp_vid:/videos"
volume_videos1="-v $dir_tmp_vid2:/tmp/videos"

volume_share='-v /share:/share:ro'
volume_x11="" #-v /tmp/.X11-unix/X${XE_DISP_NUM}:/tmp/.X11-unix/X${XE_DISP_NUM}"



 #   -e SCREEN_WIDTH -e SCREEN_HEIGHT -e XE_DISP_NUM \
commander docker run \
    --privileged -d --name=$name \
    -p=0.0.0.0:4444:24444 -p=0.0.0.0:5920:25900 \
    -p=0.0.0.0:2222:22222 -p=0.0.0.0:6080:26080 \
-e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 \
    $volume_x11 \
    -e NOVNC=true \
    -e VNC_PASSWORD=ofer \
    $env_videos \
    $volume_share  \
    $volume_videos1 \
    $volume_videos \
    elgalu/selenium:latest

echo open vnc://:ooGhai0aesaesh@localhost:5920

commander docker logs -f alias_selenium #$container_id #|container-name>

    #-e SSH_AUTH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \

    #-e SSH_AUTH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \

