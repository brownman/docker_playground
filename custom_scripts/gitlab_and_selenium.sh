
source ~/.profile
source ~/.bashrc
#source ~/.nvm/nvm.sh
nvm1(){
    NVM_DIR=$HOME/.nvm
    #curl https://raw.githubusercontent.com/creationix/nvm/v0.18.0/install.sh | bash
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.20.0/install.sh | bash
    # Install nodejs/npm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install v0.10.33
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm alias default 0.10.33

    # Install brunch
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && npm install -g se-interpreter
    #bower grunt grunt-cli mean-cli gulp se-interpreter phantomjs
}

#apt-get install nodejs
#npm install -g se-interpreter
nvm1
#ls $HOME
#cat ~/config.cfg
source /extra/config.cfg
set +u
commander nvm use 0.10

ls $( npm -g root)
#commander whereis npm
#commander which npm
#commander npm -v
#commander env
#commander netstat -ntlp
commander ps fax
commander 'env | grep 4444'

#commander ls -l /extra/json_wire_protocol
#commander cat /extra/json_wire_protocol/docker/remote.sh

#commander cd /extra/json_wire_protocol
#commander export dir_root=$PWD

#commander sudo chmod +x /extra/json_wire_protocol/docker.sh
#commander bash -c /extra/json_wire_protocol/docker.sh $file_test

export file_runner='/extra/json_wire_protocol/docker.sh'
