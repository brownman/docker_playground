source ~/.profile
source ~/.bashrc
source ~/.nvm/nvm.sh
#ls $HOME
#cat ~/config.cfg
source ~/config.cfg
set +u
commander nvm use 0.10
commander whereis npm
commander which npm
commander npm -v
commander env
commander netstat -ntlp
commander ps fax
commander 'env | grep 4444'
commander ls -l /extra/json_wire_protocol
commander cat /extra/json_wire_protocol/docker/remote.sh

commander cd /extra/json_wire_protocol
#commander export dir_root=$PWD

commander sudo chmod +x /extra/json_wire_protocol/docker.sh
commander bash -c /extra/json_wire_protocol/docker.sh
