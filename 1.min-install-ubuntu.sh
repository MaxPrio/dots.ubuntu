#!/bin/bash

apt_ins () {
    NO_RCMNDS='--no-install-recommends'
    [[ $1 == '+' ]] && NO_RCMNDS='' && shift 1
    NO_ASK='-y'
    [[ $1 == '?' ]] && NO_ASK='' && shift 1
    sudo apt install $NO_ASK $NO_RCMNDS $@
}

sudo apt update
sudo apt upgrade

### MODIFING SYSTEM CONFIGS
# autologin
sudo mkdir -pv /etc/systemd/system/getty@tty1.service.d/
sudo bash << EOFF
cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $USER --noclear %I 38400 linux
EOF
EOFF
sudo systemctl enable getty@tty1.service

# text booting
sudo bash << EOF
cp /etc/default/grub /etc/default/grub.bak 
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/\(^.*=\).*$/#&\n\1"text"/' /etc/default/grub 
EOF
sudo sudo update-grub

# Allow executing some sudo commands without providing a password.
sudo bash << "EOFF"
cp /etc/sudoers /etc/sudoers.bak
cat >> /etc/sudoers << "EOF"
#
# Allow members of group sudo to execut some commands without providing a password.
%sudo   ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown
EOF
EOFF

### INSTALLING PRIMARY TOOLS ...
echo 'Installing primary tools ...'
apt_ins + software-properties-common curl

### XSERVER
echo 'Installing X11-xserver ...'
apt_ins xorg xinit x11-xserver-utils

### GPU
# installing ubuntu-drivers
echo 'Installing ubuntu-drivers ...'
sudo add-apt-repository --yes ppa:graphics-drivers/ppa
sudo apt update
apt_ins + ubuntu-drivers-common

echo 'Cheesing recommended graphic driver, with ubuntu-drivers devices ...'
echo ''
#exaple output
#-------------
#== /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0 ==
#modalias : pci:v000010DEd00001C03sv00001043sd000085ABbc03sc00i00
#vendor   : NVIDIA Corporation
#model    : GP106 [GeForce GTX 1060 6GB]
#driver   : nvidia-driver-390 - third-party free
#driver   : nvidia-driver-410 - third-party free recommended
#driver   : nvidia-driver-396 - third-party free
#driver   : xserver-xorg-video-nouveau - distro free builtin
#-------------

tty=$(tty)
GPUdriver=$( ubuntu-drivers devices | tee $tty | grep recommended | sed 's/^.*:\ //;s/\ -\ .*$//')
#echo ''
#echo -n "Install '$GPUdriver' ? <y|any>: "
#read -n 1 -r REPLY
#echo ''
#[[ $REPLY =~ ^[Yy]$ ]] && apt_ins $GPUdriver
[[ ! -z $GPUdriver ]] && apt_ins $GPUdriver

# Alternative installing with NVIDIA installer (ION)
#curl -O https://ru.download.nvidia.com/XFree86/Linux-x86_64/340.108/NVIDIA-Linux-x86_64-340.108.run
#sudo apt-get install gcc make
#sudo bash ./NVIDIA-Linux-x86_64-340.108.run

#info (reboot first)
#lspci -k | grep -EA3 'VGA|3D|Display'
