killall python3
sleep 4


func1(){
local dir=$1
local port=$2
cd $dir
cmd="python3 -m http.server $port"
nohup $cmd 1>&2 &>/dev/null 1>&2 &>/dev/null&
}


func1 /tmp/videos  8000
func1 /tmp/videos2 8001
func1 /tmp/gitbook1/_book 8002


netstat -ntlp | egrep -h 8000\|8001\|8002
