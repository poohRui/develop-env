#!/bin/bash
#
# Install python with specific version

CUSTOM_PYTHON3_VERSION=$1

. util.sh

if [[ $(is_ubuntu) == "true" ]]; then
  sudo apt-get update && sudo apt-get install -y python${CUSTOM_PYTHON_VERSION}
	sudo rm /usr/bin/python3
	sudo ln -s /usr/bin/python${CUSTOM_PYTHON_VERSION} /usr/bin/python3
	sudo apt-get update && sudo apt-get install -y python3-pip
else
  not_implement
fi
