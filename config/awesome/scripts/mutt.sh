#!/bin/sh

id=$(xdotool search --class mutt);
if [ -z "$id" ]; then
        kitty --class mutt -e neomutt;
else
        if [ ! -f /tmp/hide_scratch ]; then
                touch /tmp/hide_scratch && xdo hide "$id"
        elif [ -f /tmp/hide_scratch ]; then
                rm /tmp/hide_scratch && xdo show "$id"
        fi
fi
