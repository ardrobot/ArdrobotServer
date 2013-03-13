This file will let you spin-up a local Ardrobot Server to test bots over the local wifi network.

## Ardrobot Server Setup

1. Install the latest version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads) if you do not currently have it installed.
2. Next, install the latest version of [Vagrant](http://downloads.vagrantup.com/) if it is not currently installed.  Make sure "/opt/vagrant/bin" was added to your path.
3. Change to the /srv directory: `cd /srv` (Run `sudo mkdir /srv` and `sudo chmod 777 /srv` if the directory doesn't exist.)
4. Clone the Ardrobot Server repo from Github: `git clone git@github.com:ardrobot/ArdrobotServer.git /srv/ArdrobotServer`  (If you don't have git installed, follow the [Github setup instructions](https://help.github.com/articles/set-up-git) then [add your ssh keys here](https://github.com/settings/ssh))
5. Change to the ArdrobotServer directory: `cd ArdrobotServer`
6. Initialize and fetch the submodules with: `git submodule init` and `git submodule update`
7. If you are not running on a Mac, edit the network connector in Vagrantfile.
8. If your home wireless network does not start with 10.0.1, update the IP address in cookbooks/ardrobot-server/ardrobot-vpn.sh.
9. Launch the Ardrobot Server (Note: This will take a long time on the initial boot): `vagrant up ardrobotserver`
10. Note the IP address of the server that is printed to the screen.  This is the address you will use to connect from VPN and VNC.
11. Optional (for development): We have set a default password of "asd123" to use for VNC connections.  To update this ssh in the server with `vagrant ssh ardrobotserver` and run `sudo vncpasswd /home/vagrant/.vnc/passwd` to change to a new 6-8 character password.

(**IMPORTANT**: *I have included client/server OpenVPN keys in this repo for local testing purposes only!  If we didn't use hard-coded keys for testing, we would need to update Android's VPN files each time we launched a new server with the current configuration; dramatically slowing development speed.  Deployment on internet accessible servers of any type will require the generation of new secure keys as described by OpenVPN.*)


## Ardrobot Server Computer Pilot Interface (VNC)

1. Install a VNC client, such as [Chicken of the VNC](http://sourceforge.net/projects/cotvnc/), if you do not already have one on your computer.
2. Open your VCN client and set the following:
    - Optional: Click the + button to create a new saved profile.
    - Set the Host to the IP address you received in step 10 above. If you don't have the IP address, see [Determining the Ardrobot Server IP Address below](https://github.com/ardrobot/ArdrobotServer#ardrobot-server-pilot-interface-vnc).
    - Enter 1 for the Display.
    - Enter the VNC password you set in step 11 above.  If you did not change the password, enter the default "asd123" password.
    - Unless you need any additional changes, leave the other settings as default
3. Click the "Connect" button to initiate the server connection.
4. If you are presented with the server's terminal instead of the visual desktop environment, start the desktop by running `nohup gnome-session &`
5. Next, you will need to start the ROS Master core service by running: `roscore`
6. At this point, you can now connect to the Ardrobot Server from the Ardrobot Android client.
7. Once the Android device is connected, you can view the video feed from the Android camera by running `rosrun image_view image_view image:=/camera/image compressed` from a new terminal tab (`shift + control + T`).
5. To send commands to pilot the bot, open yet another tab (`shift + control + T`) and run: `rosrun pr2_teleop teleop_pr2_keyboard`


## Ardrobot Server Table Pilot Interface

*Coming soon*



## Determining the Ardrobot Server IP Address

1. Open terminal and connect to the Ardrobot Server using `vagrant ssh ardrobotserver`
2. Once connected to the server, run: `ifconfig`
3. Look for the ethernet adapter that has the IP address that matches your local network -- in most cases, this will be eth1.
4. Under the ethernet adapter, look for `inet address:`.  That will be the value you should use for VPN and VNC connections.


## Stopping and Suspending the Server

*Coming soon*


## Ardrobot Client Configuration (OpenVPN)

*Coming soon*


## License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
