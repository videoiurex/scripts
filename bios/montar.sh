#!/bin/bash
set -x
mount /dev/sda3 /mnt
mkdir /mnt/home
mount /dev/sda4 /mnt/home
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
