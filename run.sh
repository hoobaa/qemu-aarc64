#!/bin/sh

# https://reviews.freebsd.org/P59
# https://lists.freebsd.org/pipermail/freebsd-snapshots/2015-April/000143.html
# https://wiki.freebsd.org/arm64
# ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/VM-IMAGES/11.0-CURRENT/aarch64/20150804/

qemu-system-aarch64 \
    -m 4096M -cpu cortex-a57 -M virt \
    -bios QEMU_EFI.fd \
    -localtime -serial telnet::4444,server -nographic \
    -drive if=none,file=./qcow2.img,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -device virtio-net-device,vlan=0,id=net0,mac=52:54:00:09:a4:37 \
    -net user,vlan=0,name=hostnet0 \
    -redir tcp:40022::22
# -curses  \
