#!/bin/bash
#
# Install tmux and configure tmux

CUSTOM_TMUX=$1
CUSTOM_TMUX_VERSION=$2

. util.sh

if [[ $(is_ubuntu) == "true" ]]; then
  sudo apt-get update && sudo apt-get install -y libutf8proc-dev libevent-dev \
     libncurses5-dev libncursesw5-dev
else
  not_implement
fi

TMUX_TAR=tmux-${CUSTOM_TMUX_VERSION}.tar.gz
TMUX_DIR=tmux-${CUSTOM_TMUX_VERSION}
# Compile the newest release for the encoding problem of utf-8 in early version
# reference https://stackoverflow.com/questions/66157606/tmux-status-line-width-with-unicode-characters
if [[ $(is_mirror) == "true" ]]; then
  wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz
else
  wget https://github.com/tmux/tmux/releases/download/${CUSTOM_TMUX_VERSION}/${TMUX_TAR}
fi

tar -xvf ${TMUX_TAR} 
rm -rf ${TMUX_TAR} 
cd ${TMUX_DIR} && ./configure --enable-utf8proc && make -j48 && sudo make install
rm -rf ${TMUX_DIR} 

if [[ -z ${CUSTOM_TMUX} ]]; then
  cp $CUSTOM_TMUX ~/
fi

