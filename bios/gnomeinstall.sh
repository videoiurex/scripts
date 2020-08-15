#!/bin/bash

set -x
#Instalar servidor X11
sudo pacman -S --noconfirm xorg-server xorg-xinit mesa mesa-demos
#Para ver la tarjeta gráfica que tienes
#lspci | grep VGA

#para ver los divers en el repositorio
#pacman -Ss xf86-video 

#Instalar driver de video
sudo pacman -S --noconfirm xf86-video-vmware

#Instalar Gnome
sudo pacman -S --noconfirm gnome gnome-extra

#Instalar gestor de inicio
sudo pacman -S --noconfirm gdm

sudo systemctl enable gdm.service
