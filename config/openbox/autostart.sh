#!/bin/sh
numlockx on &
setlayout 0 3 2 0 &
nitrogen --restore &
urxvt256c-mld -q -f -o
sh ~/.xinitrc &
sh ~/.autostart.local.sh &
xmodmap ~/.Xmodmap &
setxkbmap -layout latam
setxkbmap -option caps:escape
setxkbmap -option compose:ralt
setxkbmap -option lv3:ralt_switch
