#!/bin/bash

#Pasos para instalar ARch LInux

#Pone el teclado en Español.
Loadkeys es 

#comprobar conexión.
ping www.google.com 

#Particionar Disco:
#/dev/sda1 primaria arrancable 512M
#/dev/sda2 primaria swap 4G
#/dev/sda3 primaria Raiz 20G
#/dev/sda4 primaria resto home

#formatear particiones
mkfs.ext2 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4

#Montar Particiones
mount /dev/sda3 /mnt
mkdir /mnt/home
mount /dev/sda4 /mnt/home
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

#Puedes usar donepacstrap
#Instalar paquetes básicos
pacstrap /mnt linux-lts linux-firmware base base-devel nano os-prober grub ntfs-3g networkmanager
######################################################################################

#Crear fstab
genfstab /mnt >> /mnt/etc/fstab

#Entrar al sistema 
arch-chroot /mnt

#Asignar nombre al equipo
echo ArchZeus > /etc/hostname

#Configurar zona horaria
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

#Configurar Idioma
nano /etc/locale.gen

#Configurar el teclado
echo KEYMAP=es > /etc/vconsole.conf
echo LANG=es_ES.UTF-8 > /etc/locale.conf

#Establecer los cambios hechos
locale-gen

#Configurar el reloj
hwclock -w



#Instalar Grub
grub-install /dev/sda

#Configurar grub
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

#Establecer Contraseña root
passwd

#Crear usauario personal
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash zeus
passwd zeus

#Salir de chroot desmontar y reiniciar el sistema







