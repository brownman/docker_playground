set -u
name=$alias_selenium
env_videos='-e VIDEO=true'
dir_tmp_vid=/tmp/videos
dir_tmp_vid2=/tmp/videos2

test $dir_tmp_vid || ( mkdir -p $dir_tmp_vid )
volume_videos="-v $dir_tmp_vid:/videos"

volume_videos1="-v $dir_tmp_vid2:/tmp/videos"

volume_share='-v /share:/share:ro'
commander docker run $env_videos $volume_share  $volume_videos1 $volume_videos --privileged -d --name=$name -p=0.0.0.0:4444:24444 -p=0.0.0.0:5920:25900 \
    -p=0.0.0.0:2222:22222 -p=0.0.0.0:6080:26080 \
    -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1080 \
    -e NOVNC=true \
    -e VNC_PASSWORD=ofer \
    elgalu/selenium:latest
echo open vnc://:ooGhai0aesaesh@localhost:5920

#-e SSH_AUTH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \

    #-e SSH_AUTH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \

