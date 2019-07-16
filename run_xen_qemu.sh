#!/bin/sh

# This script runs xen Arm qemu
#

qemu-system-aarch64 \
    -machine virt,gic_version=3 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -smp 4 -m 4096 \
    -bios u-boot.bin \
    -netdev user,id=hostnet0,hostfwd=tcp::2223-:22 -device virtio-net-device,netdev=hostnet0 \
    -drive if=none,file=xenial-server-cloudimg-arm64-uefi1.img,id=hd0 -device virtio-blk-device,drive=hd0 \
    -device loader,file=Image,force-raw=on,addr=0x45000000 \
    -device loader,file=xen-uImage,force-raw=on,addr=0x49000000 \
    -device loader,file=virt-gicv3_chosen.dtb,force-raw=on,addr=0x44000000 \
    -device loader,file=Image2,force-raw=on,addr=0x4a000000 \
    -device loader,file=uramdisk.img,force-raw=on,addr=0x4b000000 \
    -monitor none \
    -nographic \
    -serial mon:stdio \


#    -serial file:smoke.serial \


