#!/bin/bash
set -e

CONTAINER_NAME=$1

if [ ! $1 ];then
    echo "Wrong arguments: ./coding \${container-name}"
    exit -1
fi

docker exec -it ${CONTAINER_NAME} /bin/zsh -l
