dname=rtl8192eu
dver=1.0
dusrdir=/usr/src/$dname-$dver
dkmsdir=/var/lib/dkms/$dname
sudo rmmod 8192eu
sudo dkms uninstall -m $dname -v $dver
sudo dkms remove -m $dname -v $dver
sudo rm -r $dusrdir
sudo rm -r $ddkmsdir
sudo mv /etc/modprobe.d/blacklist-rtl8xxxu.conf /etc/modprobe.d/blacklist-rtl8xxxu.conf.old
sudo modprobe rtl8xxxu