#!/bin/sh

set -e

RCLONE_SECRET_PATH=${RCLONE_SECRET_PATH:-'/run/secrets/rclone'}
RCLONE_CONF_PATH=${RCLONE_CONF_PATH:-'/home/rclone/.rclone.conf'}

# attempt to copy configuration from secret vault
if [ ! -f "${RCLONE_CONF_PATH}" -a -f "${RCLONE_SECRET_PATH}" ]; then
	cp "$RCLONE_SECRET_PATH" "$RCLONE_CONF_PATH"

	_confName="$( basename ${RCLONE_CONF_PATH} )"
	echo "Note: Using ${_confName} from ${RCLONE_SECRET_PATH}" >&2
fi

# always start with rclone unless some absolute path binary is specified
# eg. `docker run --rm -it xfrocks/rclone /bin/sh` 
if [ "${1:0:1}" != '/' ]; then
	set -- rclone --config "$RCLONE_CONF_PATH" "$@"
fi

echo "Executing $@..." >&2
exec "$@"
