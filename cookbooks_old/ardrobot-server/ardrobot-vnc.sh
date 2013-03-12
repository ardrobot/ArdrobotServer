#!/bin/bash

# VNC Server Install
sudo apt-get install -y vnc4server xinetd
sudo service xinetd stop
sudo killall Xvnc
sudo killall Xvnc4

# Start VNC Server
su vagrant -c 'vncserver :1'

