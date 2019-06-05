#!/bin/sh
numlockx on &
setlayout 0 3 2 0 &
nitrogen --restore &
dunst &
urxvt256c-mld -q -f -o
($HOME/.dropbox-dist/dropboxd &)&
sh ~/.xinitrc &
sh ~/.autostart.local.sh &
xmodmap ~/.Xmodmap &
setxkbmap -layout us
# setxkbmap -option caps:escape
# setxkbmap -option compose:ralt
setxkbmap us,ru -option -option "grp:rctrl_rshift_toggle" -option caps:escape -option compose:ralt
# setxkbmap -option lv3:ralt_switch
rescuetime &
# conky -d
xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1
#compton -b -d :0
