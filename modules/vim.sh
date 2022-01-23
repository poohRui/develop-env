#!/bin/bash
#
# Install vim and configure vim plugins

CUSTOM_VIMRC=$1

. util.sh

if [[ $(is_ubuntu) == "true" ]]; then
  sudo apt-get update && sudo apt-get install -y vim
else
  not_implement
fi

if [[ -z ${CUSTOM_VIMRC} ]]; then
  cp $CUSTOM_VIMRC ~/.vimrc
fi

if [[ $(use_mirror) == "true" ]]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://gitee.com/yuruilee/vim-plug/raw/master/plug.vim
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

