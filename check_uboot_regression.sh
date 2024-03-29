#!/bin/sh

UBOOT="$HOME/w/u-boot"
QEMU="$HOME/w/qemu_xen_testing"

export CROSS_COMPILE=aarch64-linux-gnu-
export ARCH=aarch64

set -eu

#build u-boot with qemu defconfig
cd "$UBOOT"
make clean -j12 > clean.log
cp "$QEMU"/.config .
make olddefconfig > olddefconfig.log
make -j12 > build.log

cp u-boot.bin "$QEMU"/

#check with qemu
cd "$QEMU"
rm -f smoke.serial
timeout -k 1 1 ./run_xen_qemu.sh 2> /dev/null || return 0

sync
test -f smoke.serial || exit 1

grep -q Hit smoke.serial

