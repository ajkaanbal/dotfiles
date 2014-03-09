#!/usr/bin/sh

#Change default lock screen
gsettings set org.mate.SettingsDaemon.plugins.media-keys screensaver '<Shift><Control>l'

#Desktop icons
gsettings set org.mate.background show-desktop-icons false

# switch between workspaces with hjkl
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-left '<Control><Alt>h'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-right '<Control><Alt>l'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-up '<Control><Alt>k'
gsettings set org.mate.Marco.global-keybindings switch-to-workspace-down '<Control><Alt>j'

#Move window to workspace
gsettings set org.mate.Marco.window-keybindings move-to-workspace-down '<Control><Shift><Alt>k'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-up '<Control><Shift><Alt>j'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-left '<Control><Shift><Alt>h'
gsettings set org.mate.Marco.window-keybindings move-to-workspace-right '<Control><Shift><Alt>l'
