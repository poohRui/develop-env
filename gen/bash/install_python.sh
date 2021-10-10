#!/bin/bash
set -e

PYTHON_VERSION=$1
LINUX_TYPE=$2

function install_python_on_ubuntu()
{
	sudo apt-get install -y python3.8
	sudo rm /usr/bin/python3
	sudo ln -s /usr/bin/python3.8 /usr/bin/python3
	sudo apt-get update
	sudo apt-get install -y python3-pip
}

if [ ${LINUX_TYPE} == "ubuntu" ]; then
		install_python_on_ubuntu
else
		echo "Unsuported linux system: "${LINUX_TYPE}
		exit -1
fi

