#!/bin/sh

# This script runs xen Arm qemu
#

qemu-system-aarch64 \
    -machine virt,gic_version=3 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -smp 4 -m 4096 \
    -bios /home/c/w/qemu_xen_testing/u-boot.bin \
    -netdev user,id=hostnet0,hostfwd=tcp::2223-:22 -device virtio-net-device,netdev=hostnet0 \
    -drive if=none,file=/home/c/w/qemu_xen_testing/xenial-server-cloudimg-arm64-uefi1.img,id=hd0 -device virtio-blk-device,drive=hd0 \
    -device loader,file=/home/c/w/qemu_xen_testing/Image,force-raw=on,addr=0x45000000 \
    -device loader,file=/home/c/w/qemu_xen_testing/xen,force-raw=on,addr=0x49000000 \
    -device loader,file=/home/c/w/qemu_xen_testing/virt-gicv3.dtb,force-raw=on,addr=0x44000000 \
    -device loader,file=/home/c/w/qemu_xen_testing/Image2,force-raw=on,addr=0x4a000000 \
    -device loader,file=/home/c/w/qemu_xen_testing/uInitramfs,force-raw=on,addr=0x4b000000 \
    -monitor none \
    -nographic \
    -serial mon:stdio \


#    -serial file:smoke.serial \



