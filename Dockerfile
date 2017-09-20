FROM alpine:3.6
MAINTAINER Dao Hoang Son <daohoangson@gmail.com>

ARG RCLONE_VERSION
ENV RCLONE_ARCH="amd64"
ENV RCLONE_BUILD_PACKAGES="unzip wget"
ENV RCLONE_RUNTIME_PACKAGES="ca-certificates"

RUN apk add --no-cache --update $RCLONE_BUILD_PACKAGES $RCLONE_RUNTIME_PACKAGES \
	&& cd /tmp \
	&& wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
	&& unzip ./rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
	&& mv ./rclone-*-linux-${RCLONE_ARCH}/rclone /usr/bin \
	&& apk del $RCLONE_BUILD_PACKAGES \
	&& (rm -rf "/tmp/"* 2>/dev/null || true) \
	&& (rm -rf /var/cache/apk/* 2>/dev/null || true)

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /home/rclone
VOLUME ["/home/rclone"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["version"]
