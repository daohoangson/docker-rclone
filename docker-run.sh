#!/bin/sh

set -- docker run \
    -v "$PWD/config":/home/rclone \
    -v "$PWD/data":/data \
    -w /data \
    -it --rm xfrocks/docker-rclone "$@"

echo "Executing $@..."
exec "$@"
