#!/bin/bash
#
# Install pip3 and configure mirror if necessary 

MIRROR_PIP_CONFIG=$1

. util.sh

if [[ $(is_ubuntu) == "true" ]]; then
	sudo apt-get update && sudo apt-get install -y python3-pip
else
  not_implement
fi

if [[ $(need_mirror) == "true" ]] && [[ -f ${MIRROR_PIP_CONFIG} ]]; then
  cp ${MIRROR_PIP_CONFIG} ~/.config/pip
fi

