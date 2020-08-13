#!/bin/bash
set -x
parted /dev/sda mklabel msdos 
parted /dev/sda mkpart primary ext2 1MiB 512MiB
parted /dev/sda set 1 boot on
parted /dev/sda mkpart primary linux-swap 512MiB 4.5GiB
parted /dev/sda mkpart primary ext4 4.5GiB 25.5GiB
parted /dev/sda mkpart primary ext4 25.5GiB 100%
