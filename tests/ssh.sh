#cmd=ls
set -u

container=brownman/onbuild #
#container=hadera-drupal


file_commands=${1:-TXT/commands.txt}

commander docker run --rm \
  -v /root/.ssh:/root/.ssh \
    --name $(date +%S)  -i  $container bash < $file_commands


#'whoami'
#\"$cmd\"

#chown -R root:root ~/.ssh && chmod -R 400 ~/.ssh'


  #-v ${USER_PRIVATE_KEY}:/root/.ssh/id_rsa \
