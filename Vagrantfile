Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["cookbooks", "cookbooks/server/berks-cookbooks"]
    chef.add_recipe "server"
  end
end
