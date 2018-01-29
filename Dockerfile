FROM alpine:3.7
MAINTAINER Dao Hoang Son <daohoangson@gmail.com>

ARG RCLONE_VERSION
ENV RCLONE_RUNTIME_PACKAGES="ca-certificates"

RUN apk add --no-cache \
    ca-certificates \
    \
  && cd /tmp \
  && wget -qO ./rclone.zip http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-amd64.zip \
  && unzip ./rclone.zip \
  && mv ./rclone-*/rclone /usr/bin \
  && (rm -rf "/tmp/"* 2>/dev/null || true)

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /home/rclone
VOLUME ["/home/rclone"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["version"]
