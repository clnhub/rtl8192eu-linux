dname=rtl8192eu
dver=1.0
dusrdir=/usr/src/$dname-$dver
sudo rmmod 8192eu
sudo rmmod rtl8xxxu
sudo dkms remove -m $dname -v $dver --all
sudo rm -r $dusrdir
sudo mkdir $dusrdir
sudo cp -ar . $dusrdir
sudo dkms add -m $dname -v $dver
sudo dkms install -m $dname -v $dver
sudo depmod -a
echo "blacklist rtl8xxxu" >> ./blacklist-rtl8xxxu.conf
sudo mv ./blacklist-rtl8xxxu.conf /etc/modprobe.d/
sudo modprobe 8192eu

