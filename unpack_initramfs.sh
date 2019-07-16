#!/bin/sh

#This script should be run with root rights

rm -rf ramdisk

dd if=uIniramfs of=ramdisk.img.gz skip=64 bs=1
gunzip ramdisk.img.gz
mkdir ramdisk; cd ramdisk
cpio -i < ../ramdisk.img


