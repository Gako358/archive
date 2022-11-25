#!/bin/sh

# Xrandr screen settings
xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
feh --bg-fill /home/merrinx/Sources/Dotfiles/Pictures/Wallpapers/light_fantasy.jpg &

DISPLAY=":0" picom -b &
Set the status bar

bash ~/.config/dwm/bar.sh &

# Autostart applications
firefox &
discord &

# Battery monitor
batsignal -b &

# Set numlock on
numlockx on

# Make sure we do not have any screensavers activated or sleep timers
xset s 0 -dpms

# Setting up the user's D-Bus Daemon
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval $(dbus-launch --exit-with-session --sh-syntax)
fi
systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
        dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# Make mouse cursor to inbuild cursor
export XCURSOR_PATH=""
export EDITOR="nvim"

# launch dwm
exec dwm
# /home/merrinx/Projects/Scheme/penrose/target/release/penrose &> /home/merrinx/.penrose.log
