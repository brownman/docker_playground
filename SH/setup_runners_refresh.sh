
#CI_SERVER_URL=https://ci.example.com REGISTRATION_TOKEN=replaceme 
set -u
set -e

source /home/linnoroot/config.cfg
test -v CI_SERVER_URL
test -v REGISTRATION_TOKEN

sudo su gitlab-ci-runner
cd gitlab-ci-runner
bundle exec ./bin/setup

