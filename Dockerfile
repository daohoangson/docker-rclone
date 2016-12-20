FROM alpine:edge
MAINTAINER Dao Hoang Son <daohoangson@gmail.com>

# global environment settings
ENV RCLONE_VERSION="current"
ENV RCLONE_ARCH="amd64"
ENV RCLONE_PACKAGES="unzip wget"

RUN apk add --no-cache --update $RCLONE_PACKAGES \
	&& cd /tmp \
	&& wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
	&& unzip ./rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
	&& mv ./rclone-*-linux-${RCLONE_ARCH}/rclone /usr/bin \
	&& apk del $RCLONE_PACKAGES \
	&& (rm -rf "/tmp/"* 2>/dev/null || true) \
	&& (rm -rf /var/cache/apk/* 2>/dev/null || true)

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN adduser -D rclone \
	&& chmod +x /docker-entrypoint.sh

USER rclone
WORKDIR /home/rclone
VOLUME ["/home/rclone"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["rclone", "--version"]