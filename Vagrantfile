# -*- mode: ruby -*-
# vi: set ft=ruby :


VAGRANTFILE_API_VERSION = "2"
LINUX_BOX_NAME = "file://D:\\projects\\bento\\builds\\virtualbox\\opscode_centos-6.5_chef-provisionerless.box"
GUEST_HOSTNAME = "#{`hostname`[0..-2]}t5.minsk.epam.com"
VERSION_PENTAHO = "5.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box="linuxPentaho-centos"
  config.vm.box_check_update = false
  config.vm.define "linuxPentaho" do |linux|
    linux.vm.box_url = (LINUX_BOX_NAME)
	linux.vm.hostname = (GUEST_HOSTNAME)
	linux.vm.provider "virtualbox" do |vb|
     vb.gui = true
	 vb.name = "host1"
	 #vb.hostname = (GUEST_HOSTNAME)
	 vb.cpus = 2
	 vb.memory = 4098
	 vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	 vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
	 vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
	 vb.customize ["modifyvm", :id, "--vram", "32"]
	 vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
	end
  end
  config.vm.network "public_network", type: "dhcp"
  config.vm.provision "shell", path: "host-script.sh", args: "#{GUEST_HOSTNAME} /etc/sysconfig/network-scripts/ifcfg-eth1"
  #config.vm.provision "shell", path: "install-pentaho-script.sh", args: "#{VERSION_PENTAHO}"
  #config.vm.provision "shell", path: "install-ui.sh", args: "#{VERSION_PENTAHO}"
  #config.vm.provision "shell", inline: "sudo echo 'DHCP_HOSTNAME=(GUEST_HOSTNAME)' >> /etc/sysconfig/network-scripts/ifcfg-eth1"
  config.vm.provision "shell", inline: "nohup sudo reboot 0 &"
end
