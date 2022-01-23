#!/bin/bash
#
# Install and config gcc and g++

CUSTOM_GCC_VERSION=$1

. util.sh

if [[ -z CUSTOM_GCC_VERSION ]]; then
  echo "The version of gcc should be specificed."
  exit 1
fi

if [[ $(is_ubuntu) == "true" ]]; then
  sudo apt-get install -y gcc-${CUSTOM_GCC_VERSION} g++-${CUSTOM_GCC_VERSION}
  sudo rm /usr/bin/gcc
  sudo rm /usr/bin/g++
  sudo ln -s /usr/bin/gcc-${CUSTOM_GCC_VERSION} /usr/bin/gcc
  sudo ln -s /usr/bin/g++-${CUSTOM_GCC_VERSION} /usr/bin/g++
else
  not_implement
fi
