#!/bin/bash -eux

sudo cp $2 ~/ifcfg-eth1.bak
sudo sed -i 's/BOOTPROTO=.*/BOOTPROTO=dhcp/g' $2
sudo sed -i 's/IPADDR=.*//g' $2
sudo sed -i 's/NETMASK=.*//g' $2
sudo sed -i 's/DHCP_HOSTNAME=.*//g' $2
sudo echo 'DHCP_HOSTNAME='$1 >> $2
sudo /etc/init.d/network restart