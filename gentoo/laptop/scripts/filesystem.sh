#!/bin/bash

function filesystem
{

    # Create partitions
    parted --script -a optimal /dev/sda 'mklabel gpt' & pid1=$!
    wait $pid1
    parted --script -a optimal /dev/sda 'mkpart efi 1MiB 513MiB' & pid2=$!
    wait $pid2
    parted --script -a optimal /dev/sda 'mkpart swap 513MiB 8705MiB' & pid3=$!
    wait $pid3
    parted --script -a optimal /dev/sda 'mkpart root 8705MiB -1' & pid4=$!
    wait $pid4
    parted --script -a optimal /dev/sda 'set 1 boot on' & pid5=$!
    wait $pid5

    clear
    echo "Done setting up partitions"

    # Print table
    lsblk

    # Format disk
    mkfs.vfat -F 32 -n ROOT /dev/sda1 &
    boot_id=$!
    wait $boot_id

    mkswap -L SWAP -f /dev/sda2 &
    swap_id=$!
    wait $swap_id

    mkfs.btrfs -L ROOT -f /dev/sda3 &
    root_id=$!
    wait $root_id
    echo "Done formatting"

    mount /dev/sda3 /mnt

    # Setup BTRFS subvolums
    btrfs subvolume create /mnt/@
    btrfs subvolume create /mnt/@log
    btrfs subvolume create /mnt/@cache
    btrfs subvolume create /mnt/@btrfs
    btrfs subvolume create /mnt/@home

    umount /mnt/
    mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@ /dev/sda3 /mnt

    # Create needed directories
    mkdir -p /mnt/{boot/efi,var/log,var/cache,home,btrfs}
    mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@log /dev/sda3 /mnt/var/log
    mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@cache /dev/sda3 /mnt/var/cache
    mount -o relatime,space_cache=v2,ssd,compress=lzo,subvol=@home /dev/sda3 /mnt/home
    mount -o relatime,space_cache=v2,ssd,compress=lzo,subvolid=5 /dev/sda3 /mnt/btrfs

    mount /dev/sda1 /mnt/boot/efi
    swapon /dev/sda2

    # List new filesystem
    clear
    df -Th
    free -h

    # Download and prepare for chroot
    cd /mnt/
    lynx https://www.gentoo.org/downloads/mirrors/

    echo "Downloading..."

    echo "tar xpvf /mnt/stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner"

    # Make.conf
    echo "Run ./install base"
}
