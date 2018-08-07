# rtl8192eu-linux
rtl8192eu Linux driver v5.2.19.1

This driver is based on the official Realtek v5.2.19.1 driver with fixes and improvements to support the latest kernels (up to 4.17).

### Unload and remove old driver(s)

* Check old loaded drivers with `sudo lshw -C network` and unload with `sudo rmmod 8192eu` or `sudo rmmod rtl8xxxu` or use a custom module name.

* Check dkms status with `dkms status` and remove with `sudo dkms remove rtl8192eu/1.0 --all` or use a custom driver version or name.

### Install new driver

Clone, extract and cd into main driver directory and run add and install commands:

```
sudo dkms add .
sudo dkms install rtl8192eu/1.0
```
### Load driver (or reboot)

`sudo modprobe 8192eu`




