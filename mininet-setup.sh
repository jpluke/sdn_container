#!/usr/bin/env bash

sudo apt-get install -y python-webob python-greenlet python-routes net-tools

git clone https://github.com/mininet/mininet
pushd mininet
git checkout -b 2.2.2 2.2.2  # or whatever version you wish to install
mkdir -p /usr/share/man/man1
./util/install.sh -fn03
popd
