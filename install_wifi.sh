sudo rmmod 8192eu
sudo rmmod rtl8xxxu
sudo dkms remove rtl8192eu/1.0 --all
sudo dkms add .
sudo dkms install rtl8192eu/1.0
sudo depmod -a
echo "blacklist rtl8xxxu" >> ./blacklist-rtl8xxxu.conf
sudo mv ./blacklist-rtl8xxxu.conf /etc/modprobe.d/
sudo modprobe 8192eu

