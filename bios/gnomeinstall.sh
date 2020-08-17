#!/bin/bash

set -x
#Instalar servidor X11
sudo pacman -S xorg-server xorg-xinit mesa mesa-demos
#Para ver la tarjeta gráfica que tienes
#lspci | grep VGA

#para ver los divers en el repositorio
#pacman -Ss xf86-video 

#Instalar driver de video
<<<<<<< HEAD
sudo pacman -S xf86-video-vmware
=======
sudo pacman -S  --noconfirm xf86-video-vmware
>>>>>>> 1e2ee245a3c43e54fde799fafee559094a431f37

#Instalar Gnome
sudo pacman -S  --noconfirm gnome gnome-extra

#Instalar gestor de inicio
sudo pacman -S --noconfirm gdm

sudo systemctl enable gdm.service
