#!/bin/bash

function stage1
{
    # Since using another live usb, need to mount shm
    test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
    mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm

    # Building repos
    emerge-webrsync & pid1=$!
    wait $pid1

    # Sync the DB
    emerge --sync & pid2=$!
    wait $pid2

    echo "Europe/Oslo" > /etc/timezone
    emerge --config sys-libs/timezone-data & pid3=$!
    wait $pid3
    echo "Europe/Oslo"

    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
    locale-gen & pid4=$!
    wait $pid4

    eselect locale set 3 & pid5=$!
    wait $pid5
    echo "LANG=en_US.UTF-8"

    eselect profile set 5 & pid6=$!
    wait $pid6
    echo "selected desktop profile"

    env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
    echo "Updated environment"

    # Install kernel
    emerge sys-kernel/gentoo-kernel-bin & pid7=$!
    wait $pid7
    echo "Installed kernel"

    # Install binary packages
    echo "dev-lang/rust-bin rust-src rustfmt nightly" >> /etc/portage/package.use/rust
    echo "dev-lang/rust-bin llvm_targets_WebAssembly" >> /etc/portage/package.use/rust
    echo "virtual/rust rustfmt"
    echo "dev-lang/rust-bin" >> /etc/portage/package.accept_keywords/rust
    echo "virtual/rust" >> /etc/portage/package.accept_keywords/rust
    emerge dev-lang/rust-bin & pid8=$!
    wait $pid8

    # Update world
    emerge --update --deep --newuse --with-bdeps=y @world & pid9=$!
    wait $pid9
    echo "Updated world"

    # Install firmware
    mkdir /etc/portage/package.license/
    echo "sys-kernel/linux-firmware @BINARY-REDISTRIBUTABLE" >> /etc/portage/package.license/firmware
    emerge sys-kernel/linux-firmware & pid10=$!
    wait $pid10
    echo "Installed firmware"
}
