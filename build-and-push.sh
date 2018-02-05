#!/bin/sh

set -e

LATEST_VERSION="1.39"
DOCKER_HUB_IMAGE="xfrocks/rclone"
DOCKER_HUB_IMAGE_WITH_TAG="${DOCKER_HUB_IMAGE}:${LATEST_VERSION}"

docker build --build-arg RCLONE_VERSION="v${LATEST_VERSION}" -t "${DOCKER_HUB_IMAGE}" .
docker tag "${DOCKER_HUB_IMAGE}" "${DOCKER_HUB_IMAGE_WITH_TAG}"

while true
do
  read -p "Push ${DOCKER_HUB_IMAGE} and ${DOCKER_HUB_IMAGE_WITH_TAG}? [yN]" yn
  case $yn in
    [Yy]* ) break;;
    * )
      exit 0;;
  esac
done
docker push "${DOCKER_HUB_IMAGE}"
docker push "${DOCKER_HUB_IMAGE_WITH_TAG}"
