#!/bin/bash

# Network
echo "Connect to wifi 咱们家_5G"
iwctl station wlan0 scan on
iwctl station wlan0 connect 咱们家_5G
ip addr

# Remote
systemctl start sshd
echo "Set the password for root"
passwd

# Time
timedatectl set-ntp true

# Mirrors
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
pacman -R reflector
sed -i '1i\Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
pacman -Sy
pacman -Syy

# Fonts
setfont LatGrkCyr-12x22.psfu.gz
