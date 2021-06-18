#!/usr/bin/env bash

set -e
[ -n "$PYENV_DEBUG" ] && set -x

if [ -z "$PYENV_ROOT" ]; then
  PYENV_ROOT="${HOME}/.pyenv"
fi

# Default settings
GIT_PREFIX=${GIT_PREFIX:-https://github.com}
REPO_OWNER=${REPO_OWNER:-pyenv}

colorize() {
  if [ -t 1 ]; then printf "\e[%sm%s\e[m" "$1" "$2"
  else echo -n "$2"
  fi
}

# Checks for `.pyenv` file, and suggests to remove it for installing
if [ -d "${PYENV_ROOT}" ]; then
  { echo
    colorize 1 "WARNING"
    echo ": Can not proceed with installation. Kindly remove the '${PYENV_ROOT}' directory first."
    echo
  } >&2
    exit 1
fi

shell="$1"
if [ -z "$shell" ]; then
  shell="$(ps c -p "$PPID" -o 'ucomm=' 2>/dev/null || true)"
  shell="${shell##-}"
  shell="${shell%% *}"
  shell="$(basename "${shell:-$SHELL}")"
fi

failed_checkout() {
  echo "Failed to git clone $1"
  exit -1
}

checkout() {
  [ -d "$2" ] || git clone --depth 1 "$1" "$2" || failed_checkout "$1"
}

if ! command -v git 1>/dev/null 2>&1; then
  echo "pyenv: Git is not installed, can't continue." >&2
  exit 1
fi

if [ -n "${USE_GIT_URI}" ]; then
  GITHUB="git://github.com"
else
  GITHUB="https://github.com"
fi

checkout "${GIT_PREFIX}/${REPO_OWNER}/pyenv.git"            "${PYENV_ROOT}"
checkout "${GIT_PREFIX}/${REPO_OWNER}/pyenv-doctor.git"     "${PYENV_ROOT}/plugins/pyenv-doctor"
checkout "${GIT_PREFIX}/${REPO_OWNER}/pyenv-installer.git"  "${PYENV_ROOT}/plugins/pyenv-installer"
checkout "${GIT_PREFIX}/${REPO_OWNER}/pyenv-update.git"     "${PYENV_ROOT}/plugins/pyenv-update"
checkout "${GIT_PREFIX}/${REPO_OWNER}/pyenv-virtualenv.git" "${PYENV_ROOT}/plugins/pyenv-virtualenv"
checkout "${GIT_PREFIX}/${REPO_OWNER}/pyenv-which-ext.git"  "${PYENV_ROOT}/plugins/pyenv-which-ext"

if ! command -v pyenv 1>/dev/null; then
  { echo
    colorize 1 "WARNING"
    echo ": seems you still have not added 'pyenv' to the load path."
    echo
  } >&2

  case "$shell" in
  bash )
    profile="~/.bashrc"
    ;;
  zsh )
    profile="~/.zshrc"
    ;;
  ksh )
    profile="~/.profile"
    ;;
  fish )
    profile="~/.config/fish/config.fish"
    ;;
  * )
    profile="your profile"
    ;;
  esac

  { echo "# Load pyenv automatically by adding"
    echo "# the following to ${profile}:"
    echo
    case "$shell" in
    fish )
      echo "set -x PATH \"${PYENV_ROOT}/bin\" \$PATH"
      echo 'status --is-interactive; and . (pyenv init -|psub)'
      echo 'status --is-interactive; and . (pyenv virtualenv-init -|psub)'
      ;;
    * )
      echo "export PATH=\"${PYENV_ROOT}/bin:\$PATH\""
      echo "eval \"\$(pyenv init -)\""
      echo "eval \"\$(pyenv virtualenv-init -)\""
      ;;
    esac
  } >&2
fi

