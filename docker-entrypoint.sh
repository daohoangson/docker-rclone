#!/bin/sh

set -e

RCLONE_CONF_PATH=${RCLONE_CONF_PATH:-'/home/rclone/.rclone.conf'}

# always start with rclone unless some absolute path binary is specified
# eg. `docker run --rm -it xfrocks/rclone /bin/sh` 
if [ "${1:0:1}" != '/' ]; then
	set -- rclone "$@"
fi

if [ ! -f "$RCLONE_CONF_PATH" ]; then
	echo "$RCLONE_CONF_PATH not found, start configuration routine..."
	rclone config
fi

if [ ! -f "$RCLONE_CONF_PATH" ]; then
	echo "$RCLONE_CONF_PATH still not found, bye bye..."
	exit 1
fi

echo "Executing $@..."
exec "$@"