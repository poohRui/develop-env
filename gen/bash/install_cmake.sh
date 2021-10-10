#!/bin/bash
set -e

CMAKE_VERSION=$1
LINUX_TYPE=$2

function install_cmake_dependences_on_ubuntu()
{
		sudo apt-get update && apt-get install -y curl libcurl4-openssl-dev zlib1g zlib1g.dev
}

function install_cmake()
{
		wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
		tar xf cmake-${CMAKE_VERSION}.tar.gz
		cd cmake-${CMAKE_VERSION}
		./bootstrap --system-curl
		make -j48
		sudo make install
		cd ..
		rm -rf cmake-${CMAKE_VERSION}*
}

if [ ${LINUX_TYPE} == "ubuntu" ]; then
		install_cmake_dependences_on_ubuntu
else
		echo "Unsuported linux system: "${LINUX_TYPE}
		exit -1
fi
install_cmake

