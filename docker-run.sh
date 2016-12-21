#!/bin/sh

set -e

set -- docker run -v "$PWD/config":/home/rclone -it --rm xfrocks/docker-rclone "$@"

echo "Executing $@..."
exec "$@"