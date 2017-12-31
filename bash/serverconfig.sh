#!/bin/sh
mkdir systemp
cd systemp
clear
echo -------------------------------------
echo    Script to Configure 
echo    Ubuntu Server             
echo    http://cialu.net      
echo -------------------------------------
echo
echo
echo "Enter computer name: "
read computer
echo $computer>hostname
echo "Enter domain: "
read domain
echo "Enter IP address: "
read ip
echo "Enter subnet mask: "
read sm
echo "Enter network: "
read nw
echo "Enter broadcast: "
read bc
echo "Enter gateway: "
read gw
echo "Enter DNS Server1: "
read dns1
echo "Enter DNS Server2: "
read dns2
echo 127.0.0.1 localhost>>hosts
echo $ip $computer.$domain $computer>>hosts
echo "# The loopback network interface">>interfaces
echo auto lo>>interfaces
echo iface lo inet loopback>>interfaces
echo "# The primary network interface">>interfaces
echo auto eth0>>interfaces
echo iface eth0 inet static>>interfaces
echo        address $ip>>interfaces
echo        netmask $sm>>interfaces
echo        network $nw>>interfaces
echo        broadcast $bc>>interfaces
echo        gateway $gw>>interfaces
echo        "# dns-* options are implemented by the resolvconf package, if installed">>interfaces
echo        dns-nameservers $dns1 $dns2>>interfaces
echo        dns-search $domain>>interfaces
mv /etc/hosts /etc/hosts.old
mv /etc/hostname /etc/hostname.old
mv /etc/network/interfaces /etc/network/interfaces.old
mv hostname /etc
mv hosts /etc
mv interfaces /etc/network
cd ..
rm -R systemp
echo Server rebooting in 10 seconds...
sleep 10
shutdown -r now
