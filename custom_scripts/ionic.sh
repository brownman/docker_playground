export dir_project=$PWD
export dir_home=$HOME

#ls -l $dir_project
#


source ~/.profile
source ~/.bashrc
source ~/.nvm/nvm.sh
#ls $HOME
#cat ~/config.cfg
source ~/config.cfg
set +u
commander nvm use 0.10
#commander whereis npm
#commander which npm
#commander npm -v
#commander env
#commander netstat -ntlp
commander ps fax
#commander 'env | grep 4444'
#commander env

#commander ls -l /extra/json_wire_protocol
#commander cat /extra/json_wire_protocol/docker/remote.sh

#commander cd /extra/json_wire_protocol
#commander export dir_root=$PWD

#commander sudo chmod +x /extra/json_wire_protocol/docker.sh
#commander bash -c /extra/json_wire_protocol/docker.sh $file_test


commander "ls -l $( npm -g root )"

commander cd $dir_project
commander ls -l
commander cat package.json
commander npm install -g
commander npm link
commander npm test

