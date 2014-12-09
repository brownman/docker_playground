set -u
test -v CONTAINER
sudo   docker run -d \
    -e CI_SERVER_URL=$CI_SERVER_URL \
    -e REGISTRATION_TOKEN=$REGISTRATION_TOKEN \
    -e HOME=/opt/mean1 \
    -e GITLAB_SERVER_FQDN=git.mean.io \
    $CONTAINER
#brownman/gitlab-ci-runner-nodejs
