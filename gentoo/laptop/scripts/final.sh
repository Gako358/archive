#!/bin/bash

function final
{
    echo "Updating DB"
    emerge --sync && eix-update & pid1=$!
    wait $pid1

    echo "seting up fonts"
    echo "media-fonts/nerd-fonts 3270 X agave anonymouspro arimo asansmono dejavusansmono droidsansmono hack inconsolata iosevka jetbrainsmono liberationmono monoid mplus noto robotomono spacemono ubuntu ubuntumono" >> /etc/portage/package.use/nerdfonts
    echo "media-fonts/nerd-fonts Vic-Fieger-License" >> /etc/portage/license/nerd-fonts
    emerge media-fonts/nerd-fonts & pid2=$!
    wait $pid2

    echo "media-fonts/material-design-icons ~amd64" >> /etc/portage/package.accept_keywords/material
    emerge media-fonts/material-design-icons & pid3=$!
    wait $pid3

    # accept_keywords
    echo "dev-vcs/lazygit ~amd64" >> /etc/portage/package.accept_keywords/lazygit
    echo "media-sound/mopidy ~amd64" >> /etc/portage/package.accept_keywords/mopidy
    echo "=dev-python/pykka-3.0.2 ~amd64" >> /etc/portage/package.accept_keywords/mopidy
    echo "media-plugins/mopidy-spotify ~amd64" >> /etc/portage/package.accept_keywords/mopidy
    echo ">=dev-libs/libspotify-12.1.51 ~amd64" >> /etc/portage/package.license/spotify
    echo ">=dev-python/pyspotify-2.0.5 ~amd64" >> /etc/portage/package.license/spotify
    echo "media-plugins/mopidy-mpd ~amd64" >> /etc/portage/package.accept_keywords/mopidy
    echo "x11-misc/picom-jonaburg ~amd64" >> /etc/portage/package.accept_keywords/picom
    echo "x11-misc/pcmanfm ~amd64" >> /etc/portage/package.accept_keywords/pcmanfm
    echo "x11-libs/libfm" >> /etc/portage/package.accept_keywords/pcmanfm

    # Use
    echo ">=media-libs/libvpx-1.11.0 postproc" >> /etc/portage/package.use/firefox
    echo ">=app-text/texlive-core-2021-r1 xetex" >> /etc/portage/package.use/latex
    echo "media-sound/ncmpcpp visualizer" >> /etc/portage/package.use/ncmpcpp
    echo "app-text/zathura synctex" >> /etc/portage/package.use/zathura

    # License
    echo "net-im/discord-bin all-rights-reserved" >> /etc/portage/package.license/discord
    echo ">=dev-libs/libspotify-12.1.51 Spotify" >> /etc/portage/package.license/spotify

    # Fianl packages
    emerge media-sound/mopidy media-plugins/mopidy-spotify media-plugins/mopidy-mpd  www-client/firefox-bin net-im/discord-bin\
        net-irc/weechat app-backup/snapper app-containers/docker app-text/texlive-core app-text/zathura app-text/zathura-pdf-mupdf\
        dev-tex/latexmk dev-texlive/texlive-bibtexextra dev-texlive/texlive-fontsextra dev-texlive/texlive-formatsextra dev-texlive/texlive-latexextra\
        gnome-extra/gucharmap lxde-base/lxappearance media-fonts/fontawesome media-fonts/noto-emoji media-fonts/unifont media-gfx/feh media-gfx/gimp\
        media-gfx/scrot app-text/wgetpaste media-sound/mpd media-sound/pulseaudio media-sound/mpc media-sound/ncmpcpp mail-client/neomutt x11-misc/pcmanfm & pid4=$!
    wait $pid4

    clear
    echo "sudo chown -R merrinx:merrinx Sources"
    echo "Copy config files and xinitrc, then reboot"
}
