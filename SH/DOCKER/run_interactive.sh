set -u
 #sudo docker run -e CI_SERVER_URL=https://ci.example.com -e REGISTRATION_TOKEN=replaceme -e HOME=/root -i -t codingforce/gitlab-ci-runner-nejs:latest /bin/bash

name=$(./DETECT/selenium_alias.sh | cut -d',' -f1)

cmd=${1:-bash}


link="--link $name:selenium"

commander sudo docker run $link \
	-e HOME=/home/gitlab_ci_runner \
    -e CI_SERVER_URL=$CI_SERVER_URL \
    -e REGISTRATION_TOKEN=$REGISTRATION_TOKEN \
    -e GITLAB_SERVER_FQDN=git.mean.io \
     -i -t $CONTAINER /bin/bash -c "$cmd"

    #-e HOME=/root \

# Based on https://github.com/gitlabhq/gitlab-ci-runner/blob/master/Dockerfile
# by Sytse Sijbrandij <sytse@gitlab.com>

# This script will start a runner in a docker container.
#
# First build the container and give a name to the resulting image:
# docker build -t codingforce/gitlab-ci-runner-nodejs github.com/bkw/gitlab-ci-runner-nodejs
#
# Then set the environment variables and run the gitlab-ci-runner in the container:
# docker run -e CI_SERVER_URL=https://ci.example.com -e REGISTRATION_TOKEN=replaceme -e HOME=/root -e GITLAB_SERVER_FQDN=gitlab.example.com codingforce/gitlab-ci-runner-nodejs
#
# After you start the runner you can send it to the background with ctrl-z
# The new runner should show up in the GitLab CI interface on /runners
#
# You can start an interactive session to test new commands with:

#od
# If you ever want to freshly rebuild the runner please use:
# docker build -no-cache -t codingforce/gitlab-ci-runner-nodejs github.com/bkw/gitlab-ci-runner-nodejs
