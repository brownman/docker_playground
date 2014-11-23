echo Place the init.d file:

cd /home/gitlab_ci_runner/gitlab-ci-runner
sudo cp ./lib/support/init.d/gitlab_ci_runner /etc/init.d/gitlab-ci-runner
sudo chmod +x /etc/init.d/gitlab-ci-runner
sudo update-rc.d gitlab-ci-runner defaults 21 
