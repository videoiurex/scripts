#!/bin/bash
set -x

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
