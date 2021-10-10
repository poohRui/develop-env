#!/bin/bash
set -e

LINUX_TYPE=$1

function install_necessary_packages_on_ubuntu()
{
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    echo 'Asia/Shanghai' >/etc/timezone

    sudo apt-get install -y git vim zsh curl tmux wget gcc make zlib1g-dev build-essential libbz2-dev \
      libssl-dev libreadline-dev libsqlite3-dev tk-dev \
      libpng-dev libfreetype6-dev libffi-dev openssh-server \
      locales busybox software-properties-common 
    export LANGUAGE=en_US.UTF-8 && \
      export LANG=en_US.UTF-8 && \
      export LC_ALL=en_US.UTF-8 && \
      sudo locale-gen en_US.UTF-8
}

if [ ${LINUX_TYPE} == "ubuntu" ]; then
		install_necessary_packages_on_ubuntu
else
		echo "Unsuported linux system: "${LINUX_TYPE}
		exit -1
fi
