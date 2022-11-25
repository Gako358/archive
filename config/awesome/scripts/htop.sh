#!/bin/sh

id=$(xdotool search --class htop);
if [ -z "$id" ]; then
        kitty --class htop -e btm;
else
        if [ ! -f /tmp/hide_scratch ]; then
                touch /tmp/hide_scratch && xdo hide "$id"
        elif [ -f /tmp/hide_scratch ]; then
                rm /tmp/hide_scratch && xdo show "$id"
        fi
fi
