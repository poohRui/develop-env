#!/bin/bash
set -e

CONTAINER_NAME=$1
IMAGE_NAME=$2
IMAGE_TAG=$3

docker run -d -it -P --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG}

