#!/bin/bash

function stage2
{
    echo "Set hostname"
    echo "hostname mXlaptop" > /etc/hostname

    # Install dhcp
    emerge net-misc/networkmanager  & pid1=$!
    wait $pid1
    echo "Installed networkmanager"

    # Netifrc
    emerge net-misc/netifrc & pid2=$!
    wait $pid2
    echo "Installed Netifrc"

    emerge app-admin/sysklogd sys-process/cronie sys-apps/mlocate & pid3=$!
    wait $pid3
    rc-update add sysklogd default
    rc-update add cronie default

    echo "Installed syslogd, cronie and mlocate"

    # Filesystem tools
    emerge sys-fs/dosfstools sys-fs/btrfs-progs & pid4=$!
    wait $pid4
    echo "Installed dosfstools and btrfs-progs"

    # Install grub
    emerge sys-boot/grub & pid5=$!
    wait $pid5
    echo "Installed grub"

    # setup grub
    grub-install --target=x86_64-efi --efi-directory=/boot/efi/ & pid6=$!
    wait $pid6

    # Install bootloader
    grub-mkconfig -o /boot/grub/grub.cfg & pid7=$!
    wait $pid7
    echo "Installed bootloader"

    # Setup User and shell
    echo ">=dev-libs/libpcre2-10.39-r1 pcre32" >> /etc/portage/package.use/fish
    emerge app-shells/fish & pid8=$!
    wait $pid8
    useradd -m -G wheel,users,audio,video -s /bin/fish merrinx
    echo "Created User and setup shell"

    # Install basic apps
    emerge dev-vcs/git sys-apps/net-tools net-wireless/wireless-tools & pid9=$!
    wait $pid9
    echo "Installed git"

    emerge app-admin/sudo sys-apps/hw-probe sys-apps/i2c-tools sys-apps/lm-sensors sys-apps/man-db & pid10=$!
    wait $pid10
    echo "Installed sudo"

    # Setup user password
    clear
    echo "Please enter a password for user merrinx and Root"
    echo "Check hostname"
    echo "check /etc/sudoers"
    echo "run ./install setup_exit"
}
