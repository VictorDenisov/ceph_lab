# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

MONITOR_IP = "172.15.0.100"
OSD_1_IP    = "172.15.0.101"
OSD_2_IP    = "172.15.0.102"
METADATA_SERVER_IP = "172.15.0.103"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu14.04-server-amd64"
	config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

	config.vm.define "monitor" do |monitor|
		monitor.vm.network "private_network", ip: MONITOR_IP
		monitor.vm.synced_folder ".", "/vagrant", nfs: true
		monitor.vm.provision "puppet" do |puppet|
			puppet.module_path = "modules"
			puppet.manifests_path = "manifests"
			puppet.manifest_file = "monitor.pp"
			puppet.hiera_config_path = "hiera_monitor.yaml"
			puppet.facter = {
				"monitor_ip" => MONITOR_IP,
				"osd1_ip" => OSD_1_IP,
				"osd2_ip" => OSD_2_IP,
			}
		end
		config.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--cpus", "1"]
			vb.customize ["modifyvm", :id, "--memory", "1024"]
		end
	end

	config.vm.define "osd1" do |osd1|
		osd1.vm.network "private_network", ip: OSD_1_IP
		osd1.vm.synced_folder ".", "/vagrant", nfs: true
		osd1.vm.provision "puppet" do |puppet|
			puppet.module_path = "modules"
			puppet.manifests_path = "manifests"
			puppet.manifest_file = "osd1.pp"
			puppet.hiera_config_path = "hiera_osd1.yaml"
			puppet.facter = {
				"monitor_ip" => MONITOR_IP,
				"osd1_ip" => OSD_1_IP,
				"osd2_ip" => OSD_2_IP,
			}
		end
		config.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--cpus", "1"]
			vb.customize ["modifyvm", :id, "--memory", "1024"]
		end
	end

	config.vm.define "osd2" do |osd2|
		osd2.vm.network "private_network", ip: OSD_2_IP
		osd2.vm.synced_folder ".", "/vagrant", nfs: true
		osd2.vm.provision "puppet" do |puppet|
			puppet.module_path = "modules"
			puppet.manifests_path = "manifests"
			puppet.manifest_file = "osd2.pp"
			puppet.hiera_config_path = "hiera_osd2.yaml"
			puppet.facter = {
				"monitor_ip" => MONITOR_IP,
				"osd1_ip" => OSD_1_IP,
				"osd2_ip" => OSD_2_IP,
			}
		end
		config.vm.provider :virtualbox do |vb|
			vb.customize ["modifyvm", :id, "--cpus", "1"]
			vb.customize ["modifyvm", :id, "--memory", "1024"]
		end
	end
end
