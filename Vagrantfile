Vagrant::Config.run do |config|

  config.vm.define :ardrobotserver do |ardrobotserver|
    ardrobotserver.vm.box = "precise32"
    ardrobotserver.vm.share_folder("ardrobot-server-root", "/srv/ArdrobotServer", "./")
    ardrobotserver.vm.forward_port 5901, 5901
    ardrobotserver.vm.forward_port 1194, 1194, { :protocol => "udp" }
    

    ##########################################################################
    # EDIT THE FOLLOWING LINE FOR YOUR WIFI/ETHERNET ADAPTER IF NOT ON A MAC #
    ##########################################################################
    ardrobotserver.vm.network :bridged, :bridge => "en1: Wi-Fi (AirPort)"
    

    ardrobotserver.vm.provision :shell, :path => "cookbooks/ardrobot-server/ardrobot-ros.sh"

    ardrobotserver.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "./cookbooks"
      chef.roles_path = "./roles"
      chef.add_recipe("apt")
      chef.add_recipe("aws")
      chef.add_recipe("apparmor")
      chef.add_recipe("build-essential")
      chef.add_recipe("git::default")
      chef.add_recipe("mysql::client")
      chef.add_recipe("ardrobot-server::vnc")
    end

    ardrobotserver.vm.provision :shell, :path => "cookbooks/ardrobot-server/ardrobot-vnc.sh"    
    ardrobotserver.vm.provision :shell, :path => "cookbooks/ardrobot-server/ardrobot-vpn.sh"    
  end

end