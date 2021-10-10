#!/bin/bash
set -e

GCC_VERSION=$1
LINUX_TYPE=$2

function install_gcc_on_ubuntu()
{
    sudo apt-get install -y gcc-${GCC_VERSION} g++-${GCC_VERSION}
    sudo rm /usr/bin/gcc
    sudo rm /usr/bin/g++
    sudo ln -s /usr/bin/gcc-${GCC_VERSION} /usr/bin/gcc
    sudo ln -s /usr/bin/g++-${GCC_VERSION} /usr/bin/g++
}

if [ ${LINUX_TYPE} == "ubuntu" ]; then
		install_gcc_on_ubuntu
else
		echo "Unsuported linux system: "${LINUX_TYPE}
		exit -1
fi

