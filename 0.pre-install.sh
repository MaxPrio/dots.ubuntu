#!/bin/bash

# geting a netboot mini.iso image, with wget ...
#wget http://archive.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/current/legacy-images/netboot/mini.iso

# dumping mini.iso onto a usb-drive ...
REPLY=y
while [[ $REPLY =~ ^[yY]$ ]]
    do
        echo ''
        lsblk
        echo ''
        echo -n 'Run lsblk again?  < y | any >:'
        read -n 1 -r REPLY
        echo ''
    done
echo -n 'Enter the target device. < sdx >:'
read -r TAG_DEV
echo ''
echo 'CHECK ONE MORE TIME !!!'
echo -n "The target device is /dev/$TAG_DEV ?  < yes >: "
read -r REPLY
echo ''
[[ $REPLY =~ yes|Yes|YES ]] && echo "sudo dd if=mini.iso  of=/dev/$TAG_DEV bs=4M status=progress; sync"

cat <<"EOF"
1. For minimal install do not mark any lines in the extra software list.
2. reboot and login into console ( Contrl+Alt+F1 if no login prompt )
3. To set up font:.$ sudo dpkg-reconfigure console-setup
4. $ sudo apt update && sudo apt upgrade
5. Get the min-install-ubuntu.sh script:

EOF
