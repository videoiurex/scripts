#!/bin/bash
set -x
#Instalar Grub
grub-install /dev/sda

#Configurar grub
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
