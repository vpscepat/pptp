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
    
cara pakek
==
masuk lewat putty
kemudian kopi paste ajah scrip diatas
pecet angka 1 buat install
jika selesai jalankan lagi script "sh /root/pptp-deb7.sh"
pecet angka 2 buat adduser
jika selesai jalankan lagi script "sh /root/pptp-deb7.sh"
pecet angka 3 list user
