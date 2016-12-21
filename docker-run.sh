#!/bin/sh

DOCKER=`which docker`
CMD="$DOCKER run -v \"$PWD/config\":/home/rclone -it --rm xfrocks/docker-rclone $@"

eval "$CMD"