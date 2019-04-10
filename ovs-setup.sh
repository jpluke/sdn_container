#!/usr/bin/env bash

sudo apt-get install -y dh_python 
cd /opt
wget https://www.openvswitch.org/releases/openvswitch-2.11.0.tar.gz
tar xf openvswitch-2.11.0.tar.gz
pushd openvswitch-2.11.0
DEB_BUILD_OPTIONS='parallel=8 nocheck' fakeroot debian/rules binary
popd
sudo dpkg -i libopenvswitch*.deb openvswitch-common*.deb openvswitch-datapath-dkms*.deb python-openvswitch*.deb openvswitch-pki*.deb openvswitch-switch*.deb
sudo apt --fix-broken install -y
rm -rf *openvswitch* *ovn*
cd ~
