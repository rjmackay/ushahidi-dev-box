# -*- mode: ruby -*-
# vi: set ft=ruby :

# Basic apache dev box complete with phpunit
# ready to go for ushahidi dev
# You'll still need to handle some apache config

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-1110-server-amd64"
  # config.vm.box_url = "http://domain.com/path/to/above.box"
  config.vm.customize ["modifyvm", :id, "--memory", "512"]
  config.vm.network :hostonly, "192.168.33.12"
  config.vm.share_folder "www", "/var/www", "/Users/robbie/www/ushahidi", :nfs => true

  # Puppet provisioning
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "ubuntu-1110-server-amd64.pp"
  end
end
