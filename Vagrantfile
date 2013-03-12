# @name Ardrobot Server
# @brief Launch scripts for the Ardrobot Server
# @copyright (C) 2013 Ardrobot
# @author Todd Sampson
# @version 0.4
# @date 2013-03-11
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


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