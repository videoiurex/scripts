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

##################################################################
#después de chroot
################################################################33

#Asignar nombre al equipo
echo ArchZeus >/mnt/etc/hostname

#Configurar zona horaria
arch-chroot /mnt ln -sf usr/share/zoneinfo/Europe/Madrid etc/localtime

#Configurar Idioma
#nano /etc/locale.gen
echo es_ES.UTF-8 UTF-8 >> /mnt/etc/locale.gen

#Configurar el teclado
echo KEYMAP=es > /mnt/etc/vconsole.conf
arch-chroot /mnt echo LANG=es_ES.UTF-8 > /etc/locale.conf

#Establecer los cambios hechos
arch-chroot /mnt locale-gen

#Configurar el reloj
arch-chroot /mnt hwclock -w
#Instalar Grub
arch-chroot /mnt grub-install /dev/sda

#Configurar grub
arch-chrot /mnt os-prober
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

#Preparar red en el arranque
arch-chroot /mnt systemctl enable NetworkManager.service

#poner pass a root
clear
echo Pasword para root:
arch-chroot /mnt passwd

#Crear usauario personal
arch-chroot /mnt useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner,wheel -s /bin/bash zeus

#Poner pass a zeus
clear
echo Pasword para zeus:
arch-chroot /mnt passwd zeus

#añadir grupo wheel a sudoers
arch-chroot /mnt nano /etc/sudoers
