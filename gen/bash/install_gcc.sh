#!/bin/bash
set -e

GCC_VERSION=$1
LINUX_TYPE=$2

function install_gcc_on_ubuntu()
{
}

if [ ${LINUX_TYPE} == "ubuntu" ]; then
		install_gcc_on_ubuntu
else
		echo "Unsuported linux system: "${LINUX_TYPE}
		exit -1
fi

