#!/bin/sh

LATEST_VERSION="1.34"

docker build --build-arg RCLONE_VERSION="v$LATEST_VERSION" -t xfrocks/docker-rclone . \
	&& docker build --build-arg RCLONE_VERSION="v$LATEST_VERSION" -t "xfrocks/docker-rclone:$LATEST_VERSION" . \
	&& docker push xfrocks/docker-rclone \
	&& docker push "xfrocks/docker-rclone:$LATEST_VERSION"