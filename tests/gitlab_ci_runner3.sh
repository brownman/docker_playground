source ../config.cfg
step1(){
    set -u
commander gitlab-ci-multi-runner register \
  --non-interactive \
  --url "$CI_SERVER_URL" \
  --registration-token "$REGISTRATION_TOKEN" \
  --description "Ruby 2.1 with MySQL" \
  --executor "docker" \
  --docker-image ruby:2.1 --docker-mysql latest
}
step2(){
gitlab-ci-multi-runner register \
    --non-interactive \
    --url "https://ci.gitlab.com/" \
    --registration-token "REGISTRATION_TOKEN" \
    --description "gitlab-ci-ruby-2.1" \
    --executor "docker" \
    --docker-image ruby:2.1 --docker-mysql latest \
    --docker-postgres latest --docker-redis latest
}
step1
