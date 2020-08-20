#!/bin/bash

clear
<<<<<<< HEAD
echo Particionar disco (debe ser de al menos 60GB):
=======
echo "UNO Particionar disco (debe ser de al menos 60GB):"
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
echo parted /dev/sda mklabel msdos
echo parted /dev/sda mkpart primary ext2 1MiB 512MiB
echo parted /dev/sda set 1 boot on
echo parted /dev/sda mkpart primary linux-swap 512MiB 4.5GiB
echo parted /dev/sda mkpart primary ext4 4.5GiB 25.5GiB
<<<<<<< HEAD
echo parted /dev/sda mkpart primary ext4 25.5GiB 100%
read -p "Presione enter para ejecutar"

=======
echo iparted /dev/sda mkpart primary ext4 25.5GiB 100%
read -p "Pulsa ENTER para continuar..."
#particionar disco (debe ser de al menos 60GB)
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary ext2 1MiB 512MiB
parted /dev/sda set 1 boot on
parted /dev/sda mkpart primary linux-swap 512MiB 4.5GiB
parted /dev/sda mkpart primary ext4 4.5GiB 25.5GiB
parted /dev/sda mkpart primary ext4 25.5GiB 100%

clear
<<<<<<< HEAD
echo Formatear particiones:
=======
echo "DOS formatear particiones"
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
echo mkfs.ext2 /dev/sda1
echo mkswap /dev/sda2
echo swapon /dev/sda2
echo mkfs.ext4 /dev/sda3
echo mkfs.ext4 /dev/sda4
<<<<<<< HEAD
read -p "Presione enter para ejecutar"

=======
read -p "Pulsa ENTER para continuar..."
#formatear particiones
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
mkfs.ext2 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4

clear
<<<<<<< HEAD
echo #montar particiones
=======
echo "TRES montar particiones"
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
echo mount /dev/sda3 /mnt
echo mkdir /mnt/home
echo mount /dev/sda4 /mnt/home
echo mkdir /mnt/boot
echo mount /dev/sda1 /mnt/boot
<<<<<<< HEAD
read -p "Presione enter para ejecutar"
=======
read -p "Pulsa ENTER para continuar..."
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
#montar particiones
mount /dev/sda3 /mnt
mkdir /mnt/home
mount /dev/sda4 /mnt/home
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

clear
<<<<<<< HEAD
echo #Instalar paquetes básicos
echo pacstrap /mnt linux-lts linux-firmware linux-lts-headers base base-devel \
	nano os-prober grub ntfs-3g networkmanager
read -p "Presione enter para ejecutar"
#Instalar paquetes básicos
pacstrap /mnt linux-lts linux-firmware linux-lts-headers base base-devel \
	nano os-prober grub ntfs-3g networkmanager
clear
echo #Crear fstab
echo "genfstab /mnt >> /mnt/etc/fstab"
=======
echo "CUATRO Instalar paquetes básicos"
echo pacstrap /mnt linux-lts linux-firmware linux-lts-headers base base-devel nano os-prober 
echo grub ntfs-3g networkmanager
read -p "Pulsa ENTER para continuar..."
#Instalar paquetes básicos
pacstrap /mnt linux-lts linux-firmware linux-lts-headers base base-devel nano os-prober \
grub ntfs-3g networkmanager

<<<<<<< HEAD
clear
echo crear  fstab
echo genfstab /mnt >> /mnt/etc/fstab
read -p "Pulsa ENTER para continuar..."

=======
>>>>>>> 880b3f93c31227df57c752bfe8fc69a669550734
>>>>>>> a793147818848e2b64a41027acadb71c2b7262f5
#Crear fstab
genfstab /mnt >> /mnt/etc/fstab

##################################################################
#después de chroot
################################################################33

#Asignar nombre al equipo
echo ArchZeus >/mnt/etc/hostname

#Configurar zona horaria
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

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
