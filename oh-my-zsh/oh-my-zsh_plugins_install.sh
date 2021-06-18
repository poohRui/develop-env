#!/bin/bash

set -e

GIT_PREFIX=${GIT_PREFIX:-https://github.com}
REPO_OWNER=${REPO_OWNER:-zsh-users}

git clone ${GIT_PREFIX}/${REPO_OWNER}/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone ${GIT_PREFIX}/${REPO_OWNER}/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
