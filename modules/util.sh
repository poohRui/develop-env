#!/bin/bash
#
# Helper functions

#######################################
# Check whether the linux os is ubuntu
# Arguments:
#  None
# Return:
#  1 if linux os is ubuntu, 0 if not
#######################################
function is_ubuntu() {
  get_linux_distro
  if [[ $LINUX_OS == "Ubuntu" ]]; then
    echo "true"
  else
    echo "false"
  fi
}

#####################################################
# Helper function, features are not implemented
# Arguments:
#  None
# Return:
#  Shell will exit abnormally
#####################################################
function not_implement() {
  echo "ERROR: Not implement, will be supported soon."
  exit 1
}

########################################################
# Get and set Linux os and version
# Arguments:
#  None
# Return:
#  Linux os and version will be set in local variables
########################################################
function get_linux_distro() {
  if [[ -f /etc/lsb-release ]]; then
    . /etc/lsb-release
    LINUX_OS=$DISTRIB_ID
    LINUX_VER=$DISTRIB_RELEASE
  else
    not_implement
  fi
}

###########################################################
# Get environment variable `NEED_MIRROR` speed up download 
# Arguments:
#  None
# Return:
#  Whether to use mirror link or not
###########################################################
function need_mirror() {
  if [[ -z $NEED_MIRROR ]]; then
    echo "false"
  else
    echo "true"
  fi
}

