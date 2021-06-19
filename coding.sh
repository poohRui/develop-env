#!/bin/bash
set -e

CONTAINER_NAME=$1

docker exec -it ${CONTAINER_NAME} /bin/zsh -l
