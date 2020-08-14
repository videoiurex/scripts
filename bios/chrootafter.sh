#!/bin/bash

#Asignar nombre al equipo
echo ArchZeus > /etc/hostname

#Configurar zona horaria
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

#Configurar Idioma
#nano /etc/locale.gen
echo es_ES.UTF-8 UTF-8 >> /etc/locale.gen

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

#Preparar red en le arranque
systemctl enable NetworkManager.service

#poner pass a root
echo Pasword para root:
passwd

#Crear usauario personal
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner,wheel -s /bin/bash zeus

#Poner pass a zeus
echo Pasword para zeus:
passwd zeus

#añadir grupo wheel a sudoers
nano /etc/sudoers