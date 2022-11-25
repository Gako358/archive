#!/bin/bash

function stage3
{
    mkdir -p {Projects,Sources,Documents}
    cd /home/merrinx/Sources
    echo "Stage 3: Installing dotfiles"
    git clone https://github.com/Gako358/Dotfiles.git & pid1=$!
    wait $pid1

    cd /home/merrinx/

    echo "Installing packages"
    emerge app-arch/unzip app-portage/gentoolkit app-arch/zip app-misc/neofetch app-portage/eix app-portage/layman dev-python/pip net-libs/nodejs & pid2=$!
    wait $pid2

    echo "updating portage"
    echo "app-editors/neovim" >> /etc/portage/package.accept_keywords/neovim
    echo ">=dev-lua/luv-1.43.0.0 ~amd64" >> /etc/portage/package.accept_keywords/neovim
    echo ">=dev-libs/libvterm-0.2 ~amd64" >> /etc/portage/package.accept_keywords/neovim
    echo ">=dev-libs/libvterm-0.1.4 ~amd64" >> /etc/portage/package.accept_keywords/neovim

    echo "app-editors/neovim LUA_SINGLE_TARGET: -lua5-1 luajit" >> /etc/portage/package.use/neovim
    echo ">=dev-lua/luv-1.36.0.0 lua_single_target_luajit -lua_single_target_lua5-1" >> /etc/portage/package.use/neovim
    echo ">=dev-lua/lpeg-1.0.2-r101 lua_targets_luajit" >> /etc/portage/package.use/neovim
    echo ">=dev-lua/mpack-1.0.9-r1 lua_targets_luajit" >> /etc/portage/package.use/neovim

    echo "Installing neovim"
    emerge app-editors/neovim & pid3=$!
    wait $pid3

    echo "Installing my overlay"
    wget -q -O /etc/layman/overlays/mXoverlay.xml https://raw.githubusercontent.com/gako358/mXoverlay/main/overlay.xml

    echo "x11-misc/xdo ~amd64" >> /etc/portage/package.accept_keywords/xdo
    emerge x11-misc/xdo & pid11=$!
    wait $pid11

    echo "Installing x11 packages"
    emerge x11-base/xorg-server x11-apps/setxkbmap x11-apps/xauth x11-apps/xinit x11-apps/xprop x11-apps/xrandr x11-apps/xrdb x11-apps/xrefresh x11-apps/xsetroot x11-apps/xwininfo x11-misc/dunst x11-misc/rofi x11-misc/xdotool x11-terms/kitty x11-wm/awesome x11-apps/xbacklight & pid12=$!
    wait $pid12

    clear
    echo "add mXoverlay and guru then run setup_final"
}
