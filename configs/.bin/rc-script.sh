#!/bin/bash

# wallpaper restore
[[ ! -f ~/.wallpaper ]] \
    && ln -sf ~/.config/default-wallpaper.jpg ~/.wallpaper
feh --no-fehbg --bg-fill ~/.wallpaper

# urvt settings
xrdb -merge ~/.Xresources

# sound
[[ -f ~/.config/alsamixer.state ]] \
    && alsactl --file ~/.config/alsamixer.state restore
