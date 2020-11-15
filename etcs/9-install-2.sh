#!/bin/bash

vim ./packs2.txt
echo "ensure you have prepare confs in ./confs"
cat packs2.txt | xargs pacman -S --noconfirm
