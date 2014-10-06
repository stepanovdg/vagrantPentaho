#!/bin/bash -eux

sudo yum groupinstall -y XFCE
#sudo yum install -y firefox
#sudo yum install -y webkitgtk

sudo sed -i 's/id:3:initdefault:/id:5:initdefault:/g' /etc/inittab
#nohup startx &
