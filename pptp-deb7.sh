#!/bin/bash
#credit : google + beberapa situs
#putdispenserhere.com
#https://github.com/drewsymo

echo "menu:"
echo "1) Set up PPTP di server"
echo "2) Buat User PPTP"
echo "3) List User PPTP"
echo "4) Edit User PPTP dengan nano"
echo "5) Edit User PPTP dengan vim"
echo "6) Restart PPTP"
read x
if test $x -eq 1; then


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
rm /etc/iptables.up.rules
IP=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
cat > /etc/iptables.up.rules <<END
*filter
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s 192.168.100.0/255.255.255.0 -j ACCEPT
COMMIT

*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o venet0 -j SNAT --to-source 123.123.123.123
-A POSTROUTING -j SNAT --to-source 123.123.123.123
COMMIT
END

sed -i s/123.123.123.123/$IP/g /etc/iptables.up.rules
iptables-restore < /etc/iptables.up.rules
cat >> /etc/ppp/ip-up <<END
ifconfig ppp0 mtu 1400
END
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local

elif test $x -eq 2; then
    echo "username :"
    read u
    echo "password :"
    read p
echo "$u * $p *" >> /etc/ppp/chap-secrets
service pptpd restart

echo "user ditambahkan"
echo "Username:$u ##### Password: $p"


elif test $x -eq 3; then
tail /etc/ppp/chap-secrets

elif test $x -eq 4; then
nano /etc/ppp/chap-secrets

elif test $x -eq 5; then
vim /etc/ppp/chap-secrets

elif test $x -eq 6; then
service pptpd restart


else
exit
fi
