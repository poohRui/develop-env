#!/bin/bash

sudo apt-get update && apt-get install -y curl libcurl4-openssl-dev zlib1g zlib1g.dev
wget https://github.com/Kitware/CMake/releases/download/v3.14.1/cmake-3.14.1.tar.gz
tar xf cmake-3.14.1.tar.gz
cd cmake-3.14.1
./bootstrap --system-curl
make
make install
cd ..
rm -rf cmake-3.14.1*
