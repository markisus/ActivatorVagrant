Vagrant.configure("2") do |config|
    ## Choose your base box
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    
    ## For masterless, mount your salt file root
    config.vm.synced_folder "salt/roots/", "/srv/salt/"
    config.vm.synced_folder "../code/", "/home/vagrant/", create: true
    config.vm.network "forwarded_port", guest: 8888, host: 8888
    config.vm.network "forwarded_port", guest: 9000, host: 9000

    ## Use all the defaults:
    config.vm.provision :salt do |salt|

      salt.minion_config = "salt/minion"
      salt.verbose = true
      salt.run_highstate = true

    end

    config.vm.provider "virtualbox" do |vb|      
      vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
end