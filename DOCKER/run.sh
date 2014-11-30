sudo   docker run -d \
    -e CI_SERVER_URL=$CI_SERVER_URL \
    -e REGISTRATION_TOKEN=$REGISTRATION_TOKEN \
    -e HOME=/home \
    -e GITLAB_SERVER_FQDN=git.mean.io \
    brownman/gitlab-ci-runner-nodejs
