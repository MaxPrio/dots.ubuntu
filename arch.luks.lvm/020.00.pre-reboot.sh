#!/bin/bahs

timedatectl set-ntp true
pacman -Syy
pacman -Sy terminus-font
setfont ter-d24n

# Network
ip link
ip address
ping archlinux.org

# SSH
#===============

#passwd

#sshd -t
#systemctl status sshd.service
#systemctl enable sshd.service

#/etc/ssh/sshd_config
#...
#sPubkeyAuthentication yes
#...
#systemctl restart sshd.service

# on client
#ssh-copy-id -f -i ~/.ssh/user.gpg.ssh.pub root@server
#ssh root@server

# Partitionning
#===============
# The sed script strips off all the comments
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.

TGTDEV=/dev/sda
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # partition number 1
    # default - start at beginning of disk 
  +256M # boot parttion
  n # new partition
  p # primary partition
  2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  a # make a partition bootable
  1 # bootable partition is partition 1 -- /dev/sda1
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF


# Cryptsetup
#===============

echo 'SETTING UP LUKS on /dev/sda2...'
cryptsetup -y -v luksFormat /dev/sda2
echo 'OPENNING THE CRYPT DEVICE on /dev/sda2, as /dev/mapper/cryptlvm ...'
cryptsetup open /dev/sda2 cryptlvm
echo 'SETTING UP LOGICAL VOLUMES: lv_root(33G); lv_home ...'
pvcreate /dev/mapper/cryptlvm
vgcreate lvg0 /dev/mapper/cryptlvm
lvcreate -L 33G lvg0 -n lv_root
lvcreate -l 100%FREE lvg0 -n lv_home
modprobe dm_mod
vgscan
vgchange -ay

# Format and mount
#=================
echo 'FORMATTING...'
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/lvg0/lv_root
mkfs.ext4 /dev/lvg0/lv_home

echo 'MOUNTING...'
mount /dev/lvg0/lv_root /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
mkdir /mnt/home
mount /dev/lvg0/lv_home /mnt/home
lsblk

# Installing the base system
#==========================
reflector --country Russia --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
pacstrap -i /mnt base linux --noconfirm
genfstab -pU /mnt >> /mnt/etc/fstab

mkdir -p /mnt/home/maxprio/.ssh
cp ~/.ssh/authorized_keys /mnt/home/maxprio/.ssh/

# Chroot
#=======
# launch the in-chroot script in chroot.
mkdir /mnt/home/temp
cp 020.01.min-vc.sh /mnt/home/temp/min-vc.sh
arch-chroot /mnt /bin/bash /home/temp/min-vc.sh

# reboot
#===========
umount -R /mnt
reboot
