#!/bin/sh
export QT_QPA_PLATFORMTHEME=gtk3
export TDESKTOP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY=1


if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
