#!/bin/bash

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

