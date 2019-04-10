#!/usr/bin/env bash

# install packages
sudo apt-get install -y build-essential fakeroot debhelper autoconf \
automake libssl-dev graphviz python-all python-qt4 \
python-twisted-conch libtool git tmux vim python-pip python-paramiko \
python-sphinx uuid-runtime wget traceroute iputils-ping

sudo apt-get install -y debconf-utils
sudo echo  "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo apt-get install -y wireshark-common
sudo apt-get install -y wireshark



