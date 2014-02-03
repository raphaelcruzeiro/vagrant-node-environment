# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu_precise"
  config.vm.box_url = "http://goo.gl/8kWkm"

  config.vm.network :forwarded_port, guest: 9000, host: 9000
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  config.vm.synced_folder "./", "/srv/www"

  # config.ssh.forward_agent = true

  config.vm.provision :shell do |shell|
    shell.inline = "sudo apt-get dist-upgrade -y
                    sudo apt-get update
                    sudo apt-get install software-properties-common -y
                    sudo apt-get install python-software-properties -y
                    sudo add-apt-repository ppa:git-core/ppa -y
                    sudo apt-get update
                    sudo apt-get install git -y
                    mkdir -p /etc/puppet/modules;
                    puppet module install willdurand/nodejs;
                    puppet module install puppetlabs/mongodb;"
  end

  config.vm.provision :file do |file|
    file.source      = '~/.gitconfig'
    file.destination = '/home/vagrant/.gitconfig'
  end

  config.vm.provision :file do |file|
    file.source      = '~/.ssh/id_rsa'
    file.destination = '/home/vagrant/.ssh/id_rsa'
  end

  config.vm.provision :file do |file|
    file.source      = '~/.ssh/id_rsa.pub'
    file.destination = '/home/vagrant/.ssh/id_rsa.pub'
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet"
    puppet.manifest_file  = "site.pp"
  end

end
