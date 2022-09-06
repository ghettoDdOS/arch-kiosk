# ArchKiosk
Live OS to work in kiosk mode. Chromium browser installed as main app. As Vnc server installed x11vnc.
## Config
For config create `kiosk.sh` file in root your boot usb. This file has run on X server started. Browser hompage is set by creating a file with name `homepage` in home directory `~/homepage`.
Example:
```bash
#!/bin/sh
# Network config
sudo ip a add 192.2.0.12/255.255.0.0 dev $(ls /sys/class/net/ | grep "e" | head -1) 
sudo ip route add default via 192.2.0.1
sudo sh -c "echo nameserver 192.2.0.15 > /etc/resolv.conf"
# Date/time config
sudo timedatectl set-ntp true
sudo timedatectl set-timezone "Europe/Moscow"
# Touchscreen config
xinput set-int-prop "MASTouch TouchSystems MASTouch USB Touchscreen" "Evdev Axis Calibration" 32 103 1268 143 1072
# Homepage config
KIOSK_HOMEPAGE="https://google.com/"
echo $KIOSK_HOMEPAGE > ~/homepage
# Start VNC server
x11vnc -bg -many -display :1 -no6 -rfbport 5901 -auth /var/run/lightdm/root/:0
```
## Build
To build your custom iso run `make build` or use `mkarchiso` command.
## Build dependencies
- Archiso