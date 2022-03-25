#!/bin/bash
apk add sudo 
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
adduser joe wheel
sudo -i
sudo command with arguments
#source : https://docs.alpinelinux.org/user-handbook/0.1a/Working/post-install.html
