# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
	
	config.vm.define "lb01" do |acs|
		acs.vm.box = "ubuntu/trusty64"
		acs.vm.hostname = "lb01"
		acs.vm.network "private_network", ip: "192.168.10.10"
	end
	
	config.vm.define "app01" do |web|
		web.vm.box = "ubuntu/trusty64"
		web.vm.hostname = "app01"
		web.vm.network "private_network", ip: "192.168.20.20"
		web.vm.network "forwarded_port", guest: 80, host: 8090
	end
	
	config.vm.define "app02" do |db|
		db.vm.box = "ubuntu/trusty64"
		db.vm.hostname = "app02"
		db.vm.network "private_network", ip: "192.168.30.30"
	end
	
	config.vm.define "db01" do |db|
		db.vm.box = "ubuntu/trusty64"
		db.vm.hostname = "db01"
		db.vm.network "private_network", ip: "192.168.40.40"
	end
  
   config.vm.define "control" do |db|
		db.vm.box = "ubuntu/trusty64"
		db.vm.hostname = "control"
		db.vm.network "private_network", ip: "192.168.50.50"
	end
end
