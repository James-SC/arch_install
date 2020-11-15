#!/bin/bash
# Remote
# Time
timedatectl set-ntp true

# Mirrors
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
pacman -R reflector
sed -i '1i\Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
pacman -Sy
pacman -Syy
echo "lsblk: to check"
echo "cfdisk: to part"
echo "mkfs.vfat and mkfs.btrfs: to modify"
echo "mount /mnt /mnt/efi or /mnt/boot"
pacstrap /mnt base linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab
# chroot

arch-chroot /mnt
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

# install

pacman -S --noconfirm archlinuxcn-keyring
cat packs1.txt | xargs pacman -S --noconfirm
cat services.txt | xargs systemctl enable
systemctl mask systemd-rfkill.service systemd-rfkill.socket

# config
# ssh
echo "Port 3411" >> /etc/ssh/sshd_config
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "X11DisplayOffset 10" >> /etc/ssh/sshd_config

# Users
echo "input password of root"
passwd
useradd -m -G wheel james
echo "input password of james"
passwd james
# sed -i '/#\s%wheel\sALL=(ALL)\sALL/s/^#//g' /etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Grub
pacman -S --noconfirm grub
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch

echo "/usr/share/backgrounds"
echo "/usr/share/fonts"
echo "/wdata/ar.../james/"
echo "chown james:users -R /home/james"
