echo Setup runners
echo Create the CI runner user and clone the gitlab-ci-runner repository:

sudo gem install bundler
sudo adduser --disabled-login --gecos 'GitLab CI Runner' gitlab_ci_runner
echo ERR?
echo something looks wrong here.. one has to exit the sub-shell in order to continue executing this script

sudo su gitlab_ci_runner
cd ~/
git clone https://gitlab.com/gitlab-org/gitlab-ci-runner.git
cd gitlab-ci-runner
echo Install the gems for the runner:

bundle install --deployment
