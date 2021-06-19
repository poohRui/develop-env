#!/bin/bash
set -e

CONTAINER_NAME=$1

if [ ! $1 ];then
    echo "Wrong arguments: ./destroy \${container-name}"
    exit -1
fi

docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} 
