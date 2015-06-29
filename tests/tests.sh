
source ~/.profile
source ~/.bashrc
source ~/config.cfg
set +u
source ~/.nvm/nvm.sh
commander nvm use 0.10.33
commander "ls $( npm -g root )"
#pushd /extra/ChkBook #flightcenter >/dev/null
cd $HOME/
ls -l
#cp -rf /extra/ChkBook $HOME/
#cd $HOME/ChkBook
#./karma.sh
#ls node_modules/
#ls -l
#npm link
#bower install
#./node_modules/karma/bin/karma start
