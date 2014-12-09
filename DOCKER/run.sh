CONTAINER=${1:-$CONTAINER}
set -u
test -v CONTAINER
echo $CONTAINER >> ~/history

cat ~/history
sleep 3
sudo   docker run -d \
    -e CI_SERVER_URL=$CI_SERVER_URL \
    -e REGISTRATION_TOKEN=$REGISTRATION_TOKEN \
    -e HOME=/root \
    -e GITLAB_SERVER_FQDN=git.mean.io \
    $CONTAINER
#brownman/gitlab-ci-runner-nodejs

