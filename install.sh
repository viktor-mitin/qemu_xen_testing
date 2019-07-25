#!/bin/sh

# This script prepares environment to run xen with qemu-system-aarch64

#set -eu

# Required qemu 2.11 or greater
# qemu-system-aarch64 can be installed with command:
sudo apt install qemu-system-arm

#### U-boot notes
# U-boot must be build with QEMU options enabled, see .config file.
# U-boot version tested are u-boot v2018.03 and newer.
# However in case of >3Gb usage in needs to use v2018.07 or v2018.09
#
# In case of v2018.11 or later CONFIG_DM_RTC must be enabled.
#
# For U-boot compilation details see file check_uboot_regression.sh
####

#### Xen notes
# Xen 4.12 or newer xen version is required. 
# Latest Xen staging and xen release 4.12 code works well with it. 
#
# Use Linux kernels 4.15 or newer in case of xen release 4.12 code.
#
# In order to enable early printk in case of qemu
# the next xen compilation command line can be used:
#
# make debug=y CONFIG_EARLY_PRINTK=pl011,0x09000000,115200 \
#    XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C xen -j8
####

#The next command creates virt-gicv3.dtb file
qemu-system-aarch64 \
   -machine virt,gic_version=3 \
   -machine virtualization=true \
   -cpu cortex-a57 -machine type=virt \
   -smp 4 -m 4096 -display none \
   -machine dumpdtb=virt-gicv3.dtb

