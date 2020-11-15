#!/bin/bash

pacman -S --noconfirm archlinuxcn-keyring
vim ./packs1.txt
cat packs1.txt | xargs pacman -S --noconfirm
