Vagrant.configure("2") do |config|
  config.vm.box = "spiral/chef-trusty64"
  config.vm.box_url = "http://stuff.marvin/Vagrant%20Box%20Files/chef-trusty64.box"
  config.vm.network :forwarded_port, host: 5000, guest: 80

  config.vm.provider :virtualbox do |vb|
    # set to true if you need to see a "physical" console in a VirtualBox window
    vb.gui = false

    # add more ram (in MB), default is 1GB (1024MB)
    vb.customize ["modifyvm", :id, "--memory", "1536"]

    # uncomment the following two lines if you plan to use 2 (or more cores)
    #vb.customize ["modifyvm", :id, "--ioapic", "on"]
    #vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  #config.vm.provision "chef_solo" do |chef|
  #  chef.add_recipe "spiral::default"
    #chef.add_recipe "prometheus-api::cms-api"
  #  chef.cookbooks_path = "./"
  #end
end

