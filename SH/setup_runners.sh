echo Setup runners
echo Create the CI runner user and clone the gitlab-ci-runner repository:

sudo gem install bundler
sudo Adduser --disabled-login --gecos 'GitLab CI Runner' gitlab_ci_runner
echo  we are different user now - who is we ?

sudo su gitlab_ci_runner
cd ~/
echo this is a nice new home for a user like me
git clone https://gitlab.com/gitlab-org/gitlab-ci-runner.git
cd gitlab-ci-runner
echo Install the gems for the runner:

bundle install --deployment
