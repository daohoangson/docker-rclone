#!/bin/sh

set -e

RCLONE_CONF_PATH=${RCLONE_CONF_PATH:-'/home/rclone/.rclone.conf'}

# always start with rclone unless some absolute path binary is specified
# eg. `docker run --rm -it xfrocks/rclone /bin/sh` 
if [ "${1:0:1}" != '/' ]; then
	set -- rclone --config "$RCLONE_CONF_PATH" "$@"
fi

echo "Executing $@..."
exec "$@"