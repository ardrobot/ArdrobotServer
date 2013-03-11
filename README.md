This file will let you spin-up a local Ardrobot Server to test bots over the local wifi network.

## Ardrobot Server Setup

1. Install the latest version of [VirtualBox](https://www.virtualbox.org/wiki/Downloads) if you do not currently have it installed.
2. Next, install the latest version of [Vagrant](http://downloads.vagrantup.com/) if it is not currently installed.  Make sure "/opt/vagrant/bin" was added to your path.
3. Change to the /srv directory: `cd /srv` (Run `mkdir /srv` if the directory doesn't exist.)
4. Clone the Ardrobot Server repo from Github: `git clone git@github.com:ardrobot/ArdrobotServer.git /srv/ArdrobotServer`
5. Change to the ArdrobotServer directory: `cd ArdrobotServer`
6. Launch the Ardrobot Server (Note: This will take a long time on the initial boot): `vagrant up ardrobotserver`
7. Note the IP address of the server that is printed to the screen.  This is the address you will use to connect from VPN and VNC.
8. Finally, we have set a default password of "asd123" to use for VNC connections.  If you would like to update this, ssh in the server with `vagrant ssh ardrobotserver` and run `sudo vncpasswd /home/vagrant/.vnc/passwd` to change to a new 6-8 character password.

*(IMPORTANT: I have included client/server OpenVPN keys in this repo for local testing purposes only!  If we didn't use hard-coded keys for testing, we would need to update Android's VPN files each time we launched a new server with the current configuration; dramatically slowing development speed.  Deployment on internet accessible servers of any type will require the generation of new secure keys as described by OpenVPN.)*


## Ardrobot Server Pilot Interface (VNC)

*Coming soon*


## Ardrobot Client Configuration (OpenVPN)

*Coming soon*
