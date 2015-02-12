clear
commander test -L /tmp/crontab.sh && { echo symlink exist; } || {
commander ln -s $PWD/crontab.sh /tmp/crontab.sh
}
