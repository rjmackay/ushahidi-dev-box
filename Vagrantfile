# Basic apache dev box complete with phpunit
# ready to go for ushahidi dev
Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs-ubuntu-12042-x64-vbox4210"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./", "/var/www", id: "vagrant-root", :nfs => true
  config.vm.network "forwarded_port", guest: 22, host: 2200
  config.ssh.port = 2200

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", "ushahidi-dev-box"]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", "512"]
    virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "base.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = ["--verbose", "--templatedir", "/vagrant/puppet/templates"]
  end
end
