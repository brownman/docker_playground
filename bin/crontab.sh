#docker pull brownman/onbuild && ( echo updated brownman/onbuild on $(date) | wall;cd /root/OFER/docker_playground/; bash -c ./steps.sh \
    #docker run -i brownman/onbuild /usr/games/cowsay )  || ( echo brownman/onbuild is up to date; docker run -i brownman/onbuild /usr/games/cowsay )
cd /tmp/videos
ls -t | tail -n +4 | xargs rm

