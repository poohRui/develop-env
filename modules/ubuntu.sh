#!/bin/bash

MIRROR_SOURCE_LIST=$1

if [[ $(need_mirror) == "true" ]] && [[ -f ${MIRROR_SOURCE_LIST} ]]; then
  cp ${MIRROR_SOURCE_LIST} /etc/apt
fi
