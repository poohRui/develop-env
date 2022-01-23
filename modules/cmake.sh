#!/bin/bash
#
# Install and config cmake with specific version

. util.sh

CUSTOM_CMAKE_VERSION=$1

if [[ -z $CUSTOM_CMAKE_VERSION ]]; then
  echo "The version of cmake should be specificed."
  exit 1
fi

if [[ $(is_ubuntu) == "true" ]]; then
  sudo apt-get update && sudo apt-get install -y curl libcurl4-openssl-dev zlib1g zlib1g.dev unzip
else
  not_implement
fi

if [[ $(need_mirror) == "true" ]]; then
  wget https://gitee.com/yuruilee/CMake/repository/archive/v${CMAKE_VERSION}
  unzip v${CUSTOM_CMAKE_VERSION}
  CMAKE_DIR=CMake-v${CUSTOM_CMAKE_VERSION}
  rm -rf v${CUSTOM_CMAKE_VERSION}
else
  wget https://github.com/Kitware/CMake/releases/download/v${CUSTOM_CMAKE_VERSION}/cmake-${CUSTOM_CMAKE_VERSION}.tar.gz
  tar -xvf cmake-${CUSTOM_CMAKE_VERSION}.tar.gz
  CMAKE_DIR=cmake-${CUSTOM_CMAKE_VERSION}
  rm -rf cmake-${CUSTOM_CMAKE_VERSION}.tar.gz
fi

cd ${CMAKE_DIR} 
./bootstrap --system-curl
make -j48
sudo make install
cd ..
rm -rf ${CMAKE_DIR} 
