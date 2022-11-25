#!/bin/bash

function base
{
    # Copy the network
    cp --dereference /etc/resolv.conf /mnt/etc/
    echo "nameserver"

    mount --types proc /proc /mnt/proc
    echo "mounted proc"
    mount --rbind /sys /mnt/sys
    echo "mounted sys"
    mount --rbind /dev /mnt/dev
    echo "mounted dev"
    mount --bind /run /mnt/run
    echo "mounted run"
    mount --make-slave /mnt/run
    echo "made slave"

    echo "Run: source /etc/profile"
    echo "Run: export PS1=(chroot) $PS1"

    # source /etc/profile
    # export PS1="(chroot) ${PS1}"
    chroot /mnt /bin/bash
    if [ "$(stat -c %d:%i /)" != "$(stat -c %d:%i /proc/1/root/.)" ]; then
        echo "We are chrooted!"
    else
        echo "Chroot Failed"
    fi
}
