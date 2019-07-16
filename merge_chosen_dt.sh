#!/bin/sh

dtc -I dts -O dtb chosen.dts > chosen.dtb
fdtmerge.py --format1 dtb --format2 dtb virt-gicv3.dtb chosen.dtb virt-gicv3_chosen.dtb


