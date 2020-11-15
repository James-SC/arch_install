#!/bin/bash

vim ./services.txt
cat services.txt | xargs systemctl enable
systemctl mask systemd-rfkill.service systemd-rfkill.socket
