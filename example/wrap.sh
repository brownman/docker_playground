#https://docs.docker.com/reference/commandline/cli/
commander docker build -t docker_current .
commander 'docker run -i docker_current bash < test.sh'
