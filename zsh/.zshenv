HOMEBIN=$HOME/.local/bin:$HOME/.bin
export PATH=$HOMEBIN:$PATH
export HISTSIZE=100000
export SAVEHIST=100000

#Virtual env wrapper
export TERM=xterm-256color


#Virtual env wrapper
export WORKON_HOME=~/.pyenvs

#java vars
export JAVA_HOME=/etc/alternatives/java_sdk

export EDITOR=nvim

#neovim
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# NEO4J
export NEO4J=$HOME/.local/sources/neo4j/bin
export PATH=$PATH:$NEO4J

# GOLANG
export GOPATH=$HOME/.go
export GOROOT=$HOME/.local/sources/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# spark
export SPARK=$HOME/.local/sources/spark
export PATH=$PATH:$SPARK/bin

#Vault
export VAULT_ADDR='http://127.0.0.1:8200'

#Color man pages
export PAGER="/usr/bin/most -s"

#RUST
export RUSTBIN=$HOME/.cargo/bin
export PATH=$RUSTBIN:$PATH

#FLUTTER
export FLUTTER=$HOME/.local/sources/flutter/bin
export PATH=$FLUTTER:$PATH

#ANDROID
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_TOOLS=$ANDROID_HOME/tools/bin/
export ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
export ANDROID_EMULATOR=$ANDROID_HOME/emulator/
export PATH=$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$ANDROID_EMULATOR:$PATH

#BAT
export BAT_THEME=DarkNeon
# Enable oracle tools
export LD_LIBRARY_PATH=/usr/lib/oracle/18.3/client64/lib:$LD_LIBRARY_PATH
export PATH=/usr/lib/oracle/18.3/client64/bin:$PATH

# For Alacritty
export WINIT_HIDPI_FACTOR=1.0

#default python version
export PYENV_VERSION=3.7.4

#Dart
export DART_SDK=$HOME/.local/sources/dart-sdk/bin
export PATH=$DART_SDK:$HOME/.pub-cache/bin:$PATH

#snap
export SNAP=/var/lib/snapd/snap/bin
export PATH=$PATH:$SNAP
