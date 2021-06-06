#!/bin/bash

# wallpaper restore
[ ! -f ~/.wallpaper ] && ln -s ~/.config/default-wallpaper.jpg ~/.wallpaper
feh --no-fehbg --bg-fill ~/.wallpaper
    

# rxvt settings
xrdb -merge ~/.Xresources

# desktop icons
#exec idesk &
