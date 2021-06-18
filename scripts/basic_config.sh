#!/bin/bash
set -e

USERNAME=$1
USER_UID=$2
USER_GID=$3

function get_linux_distro()
{
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "elementary" /etc/*-release; then
        echo "elementaryOS"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
    elif grep -Eq "CentOS" /etc/*-release; then
        echo "CentOS"
    elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
    elif grep -Eq "openSUSE" /etc/*-release; then
        echo "openSUSE"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    elif grep -Eq "ManjaroLinux" /etc/*-release; then
        echo "ManjaroLinux"
    else
        echo "Unknow"
    fi
}

function install_nvim_and_nodejs_on_ubuntu()
{
    sudo apt-get install -y neovim npm exuberant-ctags build-essential python python-dev python3-dev fontconfig libfile-next-perl ack-grep git
    sudo npm config set registry https://registry.npm.taobao.org
    sudo npm install n -g
    sudo n stable
}

function basic_config_on_ubuntu()
{
    apt-get update && apt-get install -y ca-certificates
    cp /tmp/sources.list /etc/apt
    groupadd --gid $USER_GID $USERNAME \
      && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
      && apt-get update && apt-get install -y sudo \
      && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
      && chmod 0440 /etc/sudoers.d/$USERNAME

    # export DEBIAN_FRONTEND=noninteractive
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

    install_nvim_and_nodejs_on_ubuntu
}

function main()
{
    distro=`get_linux_distro`
    echo "Linux distro: "${distro}

    if [ ${distro} == "Ubuntu" ]; then
        basic_config_on_ubuntu 
    elif [ ${distro} == "Deepin" ]; then
        not_implement
    elif [ ${distro} == "LinuxMint" ]; then
        not_implement
    elif [ ${distro} == "elementaryOS" ]; then
        not_implement
    elif [ ${distro} == "Debian" ]; then
        not_implement
    elif [ ${distro} == "Kali" ]; then
        not_implement
    elif [ ${distro} == "CentOS" ]; then
        not_implement
    elif [ ${distro} == "fedora" ]; then
        not_implement
    elif [ ${distro} == "openSUSE" ]; then
        not_implement
    elif [ ${distro} == "ArchLinux" ]; then
        # basic_config_on_archlinux 
        not_implement
    elif [ ${distro} == "ManjaroLinux" ]; then
        # basic_config_on_archlinux 
        not_implement
    else
        echo "Not support linux distro: "${distro}
    fi
}

main
