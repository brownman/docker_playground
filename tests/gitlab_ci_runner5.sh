set -u
source ../gitlab_linnovate.conf
CI_SERVER_URL="$CI_SERVER_URL"
RUNNER_TOKEN="$REGISTRATION_TOKEN"
source ../config.cfg
commander "docker run --name gitlab-ci-multi-runner -d --restart=always \
  --volume /opt/gitlab-ci-multi-runner:/home/gitlab_ci_multi_runner/data \
  --env='CI_SERVER_URL=$CI_SERVER_URL' --env='RUNNER_TOKEN=$RUNNER_TOKEN' \
  --env='RUNNER_DESCRIPTION=myrunner' --env='RUNNER_EXECUTOR=shell' \
  quay.io/sameersbn/gitlab-ci-multi-runner:0.5.5-2"

