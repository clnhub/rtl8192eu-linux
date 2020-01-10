## rtl8192eu-linux
Realtek rtl8192eu Linux driver v5.2.19.1

Added injection support for use with aircrack-ng suite by pentesters and security professionals. 

I successfully tested a Tenda U3 device (rtl8192eu 0bda:818b) Kali 2019.4 Linux 5.4.0
Able to capture WPA handshake through monitor mode and also inject frames using aireplay-ng.

### Before installing

Make sure you have headers, build, dkms and git packages installed.

Check:

```
sudo apt list linux-headers-generic build-essential dkms git
```
Install if necessary:
```
sudo apt -y install linux-headers-generic build-essential dkms git
```
### Automated install

Run from driver directory:
```
./dkms-install.sh
```

### Automated remove

```
./dkms-remove.sh
```


### Manual install

Remove available drivers with (skip if `sudo lshw -C network` and `dkms status` do not show any wifi drivers):

```
sudo rmmod 8192eu
sudo rmmod rtl8xxxu
sudo dkms remove rtl8192eu/5.2.9 --all
```

Blacklist default driver (rtl8xxxu on Ubuntu):

```
echo "blacklist rtl8xxxu" >> ./blacklist-rtl8xxxu.conf
sudo mv ./blacklist-rtl8xxxu.conf /etc/modprobe.d/
```

Run add and install commands from driver directory:
```
sudo cp -r . /usr/src/rtl8192eu-5.2.9

sudo dkms add -m rtl8192eu -v 5.2.9
sudo dkms build -m rtl8192eu} -v 5.2.9
sudo dkms install -m rtl8192eu -v 5.2.9
```

Load driver (or reboot):
```
sudo modprobe 8192eu
```

### Using with aircrack-ng suite

Shut wlan if link
```
ip link set wlan0 down
```

Stop any conflicting services wpa_supplicant, network-manager etc.
```
airmon-ng check kill
```

Use iw to enable monitor mode
```
iw dev wlan0 set type monitor
```

View available wifi targets
```
airodump-ng wlan0
```

Test injection is working
```
aireplay-ng -9 wlan0
```

look for output **Injection is working!**

You might also need to unblock wlan if using rfkill if required
```
rfkill unblock all
```