export CI_SERVER_URL=$CI_SERVER_URL
export REGISTRATION_TOKEN=$REGISTRATION_TOKEN



commander gitlab-ci-multi-runner register \
--non-interactive \
--url "$CI_SERVER_URL" \
--registration-token "$REGISTRATION_TOKEN" \
--description "gitlab-ci-ruby-2.1" \
--executor "docker" \
--docker-image ruby:2.1 --docker-mysql latest \
--docker-postgres latest --docker-redis latest
