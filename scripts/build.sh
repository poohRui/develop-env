#!/bin/bash
set -e

USERNAME=$USER
USER_UID=$UID

echo -n "Please enter the name for docker: "
read NAME
if [ -z $NAME ]
then
    NAME="<None>"
fi
echo -n "Please enter the tag for docker: "
read TAG
if [ -z $TAG ]
then
    NAME="<None>"
fi
echo -n "Please enter the basic image (default: ubuntu:18.04): "
read IMAGE
if [ -z $IMAGE ]
then
    IMAGE="ubuntu:18.04"
fi
docker build --build-arg IMAGE=$IMAGE --build-arg USERNAME=$USERNAME --build-arg USER_UID=$USER_UID -t $NAME:$TAG .

