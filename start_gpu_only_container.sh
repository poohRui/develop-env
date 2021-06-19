#!/bin/bash
set -e

CONTAINER_NAME=$1
IMAGE_NAME=$2
IMAGE_TAG=$3

if [ ! $1 ] || [ ! $2 ] || [ ! $3 ];then
    echo "Wrong arguments: ./start_gpu_only_container \${container-name} \${image-name} \${image-tag}"
    exit -1
fi

docker run -d -it --shm-size=8G -P --name ${CONTAINER_NAME} --runtime=nvidia ${IMAGE_NAME}:${IMAGE_TAG}

