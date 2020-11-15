#!/bin/bash

yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
yay -P -g
yay -Syy
vim ./packs2.txt
cat packs3.txt | xargs yay -S --noconfirm
