#cmd=ls
set -u

container=hadera-drupal
cmd="sh -c 'sudo apt-get install git -y; cd /tmp; git clone git@gitlab.linnovate.net:projecttemplates/drupal-7.git;'"
file_commands=$1
docker run  --name $(date +%S)  -i  $container bash < $file_commands
#'whoami'
#\"$cmd\"

#chown -R root:root ~/.ssh && chmod -R 400 ~/.ssh'

  #-v /root/.ssh \
  #-v ${USER_PRIVATE_KEY}:/root/.ssh/id_rsa \
