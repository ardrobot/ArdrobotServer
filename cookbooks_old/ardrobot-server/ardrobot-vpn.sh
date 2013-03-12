apt-get install -y openvpn
modprobe iptable_nat
echo 1 | tee /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.8.0.1/24 -o eth0 -j MASQUERADE

mkdir /etc/openvpn/easy-rsa

cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0/* /etc/openvpn/easy-rsa/

cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/vars.erb /etc/openvpn/easy-rsa/vars
chown root:root /etc/openvpn/easy-rsa/vars
chmod 644 /etc/openvpn/easy-rsa/vars
ln -s /etc/openvpn/easy-rsa/openssl-1.0.0.cnf /etc/openvpn/easy-rsa/openssl.cnf
. /etc/openvpn/easy-rsa/vars
/etc/openvpn/easy-rsa/clean-all
#cd /etc/openvpn/easy-rsa
#./build-ca
#./build-key-server ardrobot-server
#./build-dh
#./build-key client1

# Copy files to keys directory
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/01.pem.erb /etc/openvpn/easy-rsa/keys/01.pem
# cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/02.pem.erb /etc/openvpn/easy-rsa/keys/02.pem
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/ca.crt.erb /etc/openvpn/easy-rsa/keys/ca.crt
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/ca.key.erb /etc/openvpn/easy-rsa/keys/ca.key
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/client1.crt.erb /etc/openvpn/easy-rsa/keys/client1.crt
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/client1.csr.erb /etc/openvpn/easy-rsa/keys/client1.csr
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/client1.key.erb /etc/openvpn/easy-rsa/keys/client1.key
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/dh1024.pem.erb /etc/openvpn/easy-rsa/keys/dh1024.pem
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/index.txt.attr.erb /etc/openvpn/easy-rsa/keys/index.txt.attr
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/index.txt.erb /etc/openvpn/easy-rsa/keys/index.txt
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/ardrobot-server.crt.erb /etc/openvpn/easy-rsa/keys/ardrobot-server.crt
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/ardrobot-server.csr.erb /etc/openvpn/easy-rsa/keys/ardrobot-server.csr
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/ardrobot-server.key.erb /etc/openvpn/easy-rsa/keys/ardrobot-server.key
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/dh1024.pem.erb /etc/openvpn/easy-rsa/keys/dh1024.pem
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/serial.erb /etc/openvpn/easy-rsa/keys/serial
chown root:root /etc/openvpn/easy-rsa/keys/*
chmod 644 /etc/openvpn/easy-rsa/keys/*
chmod 600 /etc/openvpn/easy-rsa/keys/*.key

# Copy files to more common location
cp /etc/openvpn/easy-rsa/keys/ardrobot-server.crt /etc/openvpn/ardrobot-server.crt
cp /etc/openvpn/easy-rsa/keys/ardrobot-server.key /etc/openvpn/ardrobot-server.key
cp /etc/openvpn/easy-rsa/keys/ca.crt /etc/openvpn/ca.crt
cp /etc/openvpn/easy-rsa/keys/dh1024.pem /etc/openvpn/dh1024.pem

# Copy server.conf to /etc/openvpn
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/server.conf.erb /etc/openvpn/server.conf

# Copy over openvpn file with autostart set to all
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/openvpn.erb /etc/default/openvpn

# Copy over client files
mkdir /etc/openvpn/client1
cp /srv/ArdrobotServer/cookbooks/ardrobot-server/templates/default/client.conf.erb /etc/openvpn/client1/client.conf
cp /etc/openvpn/easy-rsa/keys/client1.crt /etc/openvpn/client1/client1.crt
cp /etc/openvpn/easy-rsa/keys/client1.key /etc/openvpn/client1/client1.key
cp /etc/openvpn/easy-rsa/keys/ca.crt /etc/openvpn/client1/ca.crt

# Update server IP
########################################################
# UPDATE 10.0.1, BASED ON THE IP OF YOUR LOCAL NETWORK #
########################################################
IP=$(ifconfig | grep -o 10.0.1.[[:digit:]]* | head -n 1)
sed -i "s/(((SERVER_IP)))/$IP/g" /etc/openvpn/server.conf
echo "#######################################"
echo "#######################################"
echo "VPN/VNC SERVER IP is: " $IP
echo "#######################################"
echo "#######################################"

# Start VPN server
/etc/init.d/openvpn start


