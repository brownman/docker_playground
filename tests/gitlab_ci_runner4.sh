
echo hi
#https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/install/docker.md
cat /srv/gitlab-runner/config/*
docker run -d --name gitlab-runner --restart always \
      -v /var/run/docker.sock:/var/run/docker.sock \
        -v /srv/gitlab-runner/config:/etc/gitlab-runner \
          gitlab/gitlab-runner:latest
echo docker exec -it gitlab-runner gitlab-runner register

