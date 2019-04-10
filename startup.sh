#!/bin/sh

/etc/init.d/openvswitch-switch start





groupadd -g $GGID $GGROUP
mkdir -p $GHOME
useradd -u $GUID -s $GSHELL -c $GUSERNAME -g $GGID -M -d $GHOME $GUSERNAME
chown $GUSERNAME:$GGROUP $GHOME
usermod -a -G sudo $GUSERNAME
echo $GUSERNAME:docker | chpasswd

addgroup  $GUSERNAME wireshark


su -l $GUSERNAME
/bin/bash

