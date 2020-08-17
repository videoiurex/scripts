#!/bin/bash
set -x
#particionar disco (debe ser de al menos 60GB)
parted /dev/sda mklabel msdos 
parted /dev/sda mkpart primary ext2 1MiB 512MiB
parted /dev/sda set 1 boot on
parted /dev/sda mkpart primary linux-swap 512MiB 4.5GiB
parted /dev/sda mkpart primary ext4 4.5GiB 25.5GiB
parted /dev/sda mkpart primary ext4 25.5GiB 100%

#formatear particiones
mkfs.ext2 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4

#montar particiones
mount /dev/sda3 /mnt
mkdir /mnt/home
mount /dev/sda4 /mnt/home
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

#Instalar paquetes básicos
pacstrap /mnt linux-lts linux-firmware linux-lts-headers base base-devel nano os-prober grub ntfs-3g networkmanager

#Crear fstab
genfstab /mnt >> /mnt/etc/fstab

#copiar a /mnt el script para después del chroot
cp chrootafter.sh /mnt/chrootafter.sh


