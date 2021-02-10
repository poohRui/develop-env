#!/bin/bash

function Print()
{
    support_version=$1
    for ver in $support_version
    do
      echo $ver
    done
}

function CheckLegal()
{
    version=$1
    support_version=$2
    for ver in $support_version
    do
        if [ $ver = $version ]
	then
	  return 0
	fi
    done
    echo "Unsupported, only following versions available: " 
    Print $support_version
    exit -1
}

echo -n "Please enter the name for docker: "
read NAME
if [ -z $NAME ]
then
    NAME="None"
fi
echo -n "Please enter the tag for docker: "
read TAG
if [ -z $TAG ]
then
    NAME="None"
fi
echo -n "GPU environment or not: (Y/N): "
read GPU
if [ $GPU = 'Y' ] || [ $GPU = 'y' ]; then 
    echo -n "Please enter the cuda version: "
    read CUDAVERSION
    echo -n "Please enter the cudnn version: "
    read CUDNNVERSION
else
    echo -n "Please enter operation system and version (default: Ubuntu18.04): "
    read VERSION
    if [ -z $VERSION ]
    then
        VERSION="Ubuntu18.04"
    fi
    support_version=("Ubuntu18.04")
    CheckLegal $VERSION $support_version
fi

docker build -t $NAME:$TAG -f ./docker_files/Dockerfile_$VERSION .

