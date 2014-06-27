Pptp Auto Setup
====

auto setup pptp in linux
currenly working on my debian 7 
other distro will update soon

saat ini hanya untuk debian 7 saja
untuk lainya lagi kejar tanyang mas gan :D


Installation
====


cara standar :

    wget --no-check-certificate -O /root/pptp-deb7.sh https://raw.github.com/vpscepat/pptp/master/pptp-deb7.sh
    sh /root/pptp-deb7.sh

cara alternatif :

    apt-get install -y git
    cd /root && git clone git://github.com/vpscepat/pptp.git
    cd pptp && bash pptp.sh
