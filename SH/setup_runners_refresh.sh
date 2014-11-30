
#CI_SERVER_URL=https://ci.example.com REGISTRATION_TOKEN=replaceme 
#set -u
#set -e

sudo su gitlab_ci_runner  <<HERE



source /home/linnoroot/config.cfg

test -v CI_SERVER_URL
test -v REGISTRATION_TOKEN


cd /home/gitlab_ci_runner/gitlab-ci-runner
bundle exec ./bin/setup


HERE
