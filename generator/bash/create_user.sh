#!/bin/bash

set -e

USERNAME=$1
USER_UID=$2
USER_GID=$3
LINUX_TYPE=$4

function create_user_on_ubuntu()
{
    apt-get update && apt-get install -y ca-certificates
    cp /tmp/sources.list /etc/apt
    groupadd --gid $USER_GID $USERNAME \
      && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
      && apt-get update && apt-get install -y sudo \
      && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
      && chmod 0440 /etc/sudoers.d/$USERNAME
}

if [ ${LINUX_TYPE} == "ubuntu" ]; then
		create_user_on_ubuntu
else
		echo "Unsuported linux system: "${LINUX_TYPE}
fi

