#!/bin/sh

docker build -t xfrocks/docker-rclone . \
	&& docker push xfrocks/docker-rclone