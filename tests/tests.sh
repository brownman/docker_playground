
source ~/.profile
source ~/.bashrc
source ~/config.cfg
set +u
source ~/.nvm/nvm.sh
commander nvm use 0.10.33
commander "ls $( npm -g root )"
