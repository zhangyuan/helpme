## Update Package Repositories

https://pve.proxmox.com/wiki/Package_Repositories

## Import Disk

```
qm importdisk <vmid> yourimage.qcow2 namestoragepool
```

## Setup Wireless

(This only enable the host to be reachable by wireless IP.)

### Install Wireless Tools

```
apt-get install wireless-tools wpasupplicant net-tools
```


### Find the usb devices

List the USB devices.

```
root@pve:~# lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 0bda:1a2b Realtek Semiconductor Corp.
Bus 001 Device 002: ID 0424:2514 Standard Microsystems Corp. USB 2.0 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

### Switch it to wifi mode


#### Install usb-modeswitch
```
apt-get install usb-modeswitch
```

#### Switch the mode

```
usb_modeswitch -KW -v 0bda -p 1a2b
```

List the USB devices.

```
root@pve:~# lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 005: ID 0bda:c811 Realtek Semiconductor Corp.
Bus 001 Device 002: ID 0424:2514 Standard Microsystems Corp. USB 2.0 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

### Install the Driver

```
apt install git pve-headers
```

https://github.com/brektrou/rtl8821CU

### Config WLAN

#### Find the interface name

```
iwconfig
```

If the interface name `wlx(MACADDRESS)`, Run the following command and reboot:

```
ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
```



#### Add the interface

Open `/etc/network/interfaces` and append the configuration

```
auto {INTERFACE_NAME}
iface {INTERFACE_NAME} inet dhcp
           wpa-ssid {SSID}
           wpa-psk {PASSWORD}
```

Enable the interface

```
ifup {INTERFACE_NAME}
```


