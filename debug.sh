killall python3
sleep 4
cd /tmp/videos 
cmd="python3 -m http.server 8000"
nohup $cmd 1>&2 &>/dev/null 1>&2 &>/dev/null&
