
version=':2.47.1'


sec=$(date +%s)
#echo $sec
name__1=${alias_selenium:-$sec}

set_env(){
cmd__1="docker start"
#-ia" #attach + interactive 
cmd__2="docker run"
cmd__="$cmd__2"
#selenium-hub-${sec}
}
hub(){
#commander "$cmd__ -d -P --name $name__1 -e JAVA_OPTS=-Xmx512m selenium/hub"
commander docker run --privileged -p 4444:4444 -d --name $name__1  -e JAVA_OPTS=-Xmx2512m selenium/hub${version}
#$CONTAINER_SEL2
}

clients(){
commander "$cmd__ -d --link $name__1:hub akeem/selenium-node-phantomjs"
commander "$cmd__ -d --link $name__1:hub selenium/node-chrome${version}"
commander "$cmd__ -d --link $name__1:hub selenium/node-firefox${version}"
}
steps(){
set_env
hub 
clients
}
steps
