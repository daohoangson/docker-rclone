#!/bin/sh

LATEST_VERSION="1.35"

docker build --build-arg RCLONE_VERSION="v$LATEST_VERSION" -t xfrocks/rclone . \
	&& docker build --build-arg RCLONE_VERSION="v$LATEST_VERSION" -t "xfrocks/rclone:$LATEST_VERSION" . \
	&& docker push xfrocks/rclone \
	&& docker push "xfrocks/rclone:$LATEST_VERSION"