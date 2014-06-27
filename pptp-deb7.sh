#!/bin/bash
#credit : google + beberapa situs
#putdispenserhere.com
#https://github.com/drewsymo

echo "######################################################"
echo "menu:"
echo "1) Set up PPTP di server"
echo "2) Buat User PPTP"
echo "3) List User PPTP"
echo "######################################################"

if test $x -eq 1; then

#ip vps
ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`

#install program
apt-get update
apt-get -y install pptpd
update-rc.d pptpd defaults

#set konfig pptpd-options
cat > /etc/ppp/pptpd-options <<END
name pptpd
refuse-pap
refuse-chap
refuse-mschap
require-mschap-v2
require-mppe-128
ms-dns 8.8.8.8
ms-dns 8.8.4.4
proxyarp
nodefaultroute
lock
nobsdcomp
END

#setup pptpd.conf
echo "option /etc/ppp/pptpd-options" > /etc/pptpd.conf
echo "logwtmp" >> /etc/pptpd.conf
echo "localip 10.1.0.1" >> /etc/pptpd.conf
echo "remoteip 10.1.0.2-100" >> /etc/pptpd.conf

#
sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sysctl -p

###Iptables

read -p "jika sg.gs ato openvz pencet 1, sg.do ato xen/kvm pecet 2?" VMVIRTTYPE
echo $VMVIRTTYPE

if [ "$VMVIRTTYPE" = "1" ]
then
      iptables -t nat -A POSTROUTING -j SNAT --to-source $ip
	  iptables -I INPUT -p tcp --dport 1723 -m state --state NEW -j ACCEPT
	  iptables -I INPUT -p gre -j ACCEPT
	  iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -s 10.1.0.0/24 -j TCPMSS  --clamp-mss-to-pmtu
elif [ "$VMVIRTTYPE" = "2" ]
then
      
fi
