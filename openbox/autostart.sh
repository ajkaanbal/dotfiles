#!/bin/sh
numlockx on &
setlayout 0 3 2 0 &
nitrogen --restore &
urxvt256c-mld -q -f -o
sh ~/.xinitrc &
sh ~/.autostart.local.sh &
