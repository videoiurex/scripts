#Entrar al sistema
set -x
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
