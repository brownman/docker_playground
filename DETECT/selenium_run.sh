 docker run --privileged -p 4444:4444 -d --name selenium$(date +%S) eperoumalnaik/docker-chrome-selenium && { docker ps; }

