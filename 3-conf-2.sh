#!/bin/bash

# ssh
echo "Port 3411" >> /etc/ssh/sshd_config
echo "X11Forwarding yes" >> /etc/ssh/sshd_config
echo "X11DisplayOffset 10" >> /etc/ssh/sshd_config

# Users
echo "input password of root"
passwd
useradd -m -G wheel,docker,bluetooth james -s /bin/zsh
echo "input password of james"
passwd james
# sed -i '/#\s%wheel\sALL=(ALL)\sALL/s/^#//g' /etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Grub
pacman -S --noconfirm grub
mkdir /boot/grub
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
