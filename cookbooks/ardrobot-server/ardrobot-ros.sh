#!/bin/bash

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


sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

sudo apt-get update

# Ubuntu Desktop
sudo apt-get -y install ubuntu-desktop

# ROS Desktop with settings for ROS Master over VPN
sudo apt-get -y install ros-fuerte-desktop-full
echo "source /opt/ros/fuerte/setup.bash" >> /home/vagrant/.bashrc
echo "export ROS_MASTER_URI=\"http://10.8.0.1:11311\"" >> /home/vagrant/.bashrc
echo "export ROS_IP=10.8.0.1" >> /home/vagrant/.bashrc
. /home/vagrant/.bashrc
sudo apt-get install -y python-rosinstall python-rosdep
sudo apt-get install -y ros-fuerte-pr2-teleop-app

