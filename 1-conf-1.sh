# /bin/bash

# HostName
echo "CHEN" > /etc/hostname
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1	localhost" > /etc/hosts
echo "127.0.1.1 CHEN.localdomain	CHEN" > /etc/hosts

# Local and Langeuage
echo "KEYMAP=us" > /etc/vconsole
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "LC_COLLATE=C" >> /etc/locale.conf
sed -i '/#en_US.UTF-8/s/^#//g' /etc/locale.gen
sed -i '/#zh_CN.UTF-8/s/^#//g' /etc/locale.gen
locale-gen

# Time
timedatectl set-ntp true
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
timedatectl set-local-rtc true
hwclock --systohc --localtime

# Mirrors
echo "[archlinuxcn]" >> /etc/pacman.conf
echo "Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux-cn/$"arch"" >> /etc/pacman.conf
sed -i '1i\ Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
pacman -Sy
pacman -Syy
