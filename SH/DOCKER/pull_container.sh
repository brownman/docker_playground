#!/bin/bash
set -u

commander test -v CONTAINER
#https://github.com/docker/docker/issues/1060

#wrong: sudo docker pull $CONTAINER
#deprecated: commander sudo docker pull -t latest $CONTAINER

commander sudo docker pull ${CONTAINER}:latest

#codingforce/


