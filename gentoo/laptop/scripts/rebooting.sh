#!/bin/bash

function fisnished()
{
    exit
    cd
    umount -l /mnt/gentoo/dev{/shm,/pts,}
    umount -R /mnt/gentoo
    reboot
}
