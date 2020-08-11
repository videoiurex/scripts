#!/bin/bash
set -x
#Crear usauario personal
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash zeus
passwd zeus
