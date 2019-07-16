#!/bin/sh

#This script should be run with root rights

cd ramdisk
find . | cpio --create --format='newc' | gzip > ../ramdisk.img

cd ..

#mkimage -A arm64 -O linux -T ramdisk -C none -a 0x4b000000 -e 0x4b000000 \
#       -n "Modified ramdisk" -d ./ramdisk.img ./uramdisk.img
mkimage -A arm64 -O linux -T ramdisk -C none \
       -n "Modified ramdisk" -d ./ramdisk.img ./uramdisk.img
