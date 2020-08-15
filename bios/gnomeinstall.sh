#!/bin/bash

set -x
#Instalar servidor X11
sudo pacman -S xorg-server xorg-xinit mesa mesa-demos
#Para ver la tarjeta gráfica que tienes
#lspci | grep VGA

#para ver los divers en el repositorio
#pacman -Ss xf86-video 

#Instalar driver de video
pacman -S xf86-video-vmware

#Instalar Gnome
pacman -S gnome gnome-extra


