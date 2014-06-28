Pptp Auto Setup
====

auto setup pptp in linux
currenly working on my debian 7 
other distro will update soon

saat ini hanya untuk debian 7 saja
untuk lainya lagi kejar tanyang mas gan :D


Installation
====


cara standar 
openvz : (compatible dengan script dari kangarie)

    wget --no-check-certificate -O /root/pptp-deb7.sh https://raw.github.com/vpscepat/pptp/master/pptp-deb7.sh
    sh /root/pptp-deb7.sh

kvm : (need some fixing)

    wget --no-check-certificate -O /root/pptp-deb7kvm.sh https://raw.github.com/vpscepat/pptp/master/pptp-deb7kvm.sh
    sh /root/pptp-deb7.sh



cara alternatif :

    apt-get install -y git
    cd /root && git clone git://github.com/vpscepat/pptp.git
    cd pptp && bash pptp-deb7.sh
    
penjelasan
====
> masuk ke putty dengan root
> donload scrip wget --no-check-certificate -O /root/pptp-deb7.sh https://raw.github.com/vpscepat/pptp/master/pptp-deb7.sh
> ketik ==> sh /root/pptp-deb7.sh
> pecet angka 1
> ketik ==> sh /root/pptp-deb7.sh
> pecet angka 2 
> ketik ==> sh /root/pptp-deb7.sh
> pencet angka 3
