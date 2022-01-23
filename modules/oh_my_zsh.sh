#!/bin/bash
#
# Install oh my zsh

CUSTOM_ZSHRC=$1

. util.sh

if [[ $(is_ubuntu) == "true" ]]; then
  sudo apt-get update && sudo apt-get install -y zsh
else
  not_implement
fi

if [[ $(use_mirror) == "true" ]]; then
  wget https://gitee.com/yuruilee/ohmyzsh/raw/master/tools/install.sh -Oq- | sh
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  git clone https://gitee.com/yuruilee/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://gitee.com/yuruilee/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
else
  wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -Oq- | sh
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k 
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if [[ -z ${CUSTOM_ZSHRC} ]]; then
  cp $CUSTOM_ZSHRC ~/
fi
