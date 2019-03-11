FROM alpine:3.9

ARG RCLONE_VERSION

RUN apk add --no-cache \
    ca-certificates \
    wget \
    \
  && cd /tmp \
  && wget -qO ./rclone.zip http://downloads.rclone.org/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-amd64.zip \
  && unzip ./rclone.zip \
  && mv ./rclone-*/rclone /usr/bin \
  && (rm -rf "/tmp/"* 2>/dev/null || true)

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /home/rclone
VOLUME ["/home/rclone"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["version"]
