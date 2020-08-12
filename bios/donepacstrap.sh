#!/bin/bash
set -x

#Instalar paquetes básicos
pacstrap /mnt linux-lts linux-firmware base base-devel nano os-prober grub ntfs-3g networkmanager

#Crear fstab
genfstab /mnt >> /mnt/etc/fstab
