commander "docker run --name onbuild$( date +%S) -v /root/.ssh:/root/.ssh -v /tmp/22:/tmp -v /extra:/extra:ro -e HOME=/home/gitlab_ci_runner -e CI_SERVER_URL=https://ci0.gitlab.linnovate.net -e REGISTRATION_TOKEN=481f4cbc1a5420db0340 -e GITLAB_SERVER_FQDN=git.linnovate.net -i brownman/onbuild bash < TXT/gitlab.txt"



