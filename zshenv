HOMEBIN=$HOME/.local/bin
export PATH=$HOMEBIN:$PATH
export HISTSIZE=100000
export SAVEHIST=100000

#Virtual env wrapper
export WORKON_HOME=~/.pyenvs

#java vars
export JAVA_HOME="/usr/java/latest"

export EDITOR=/usr/bin/nvim

#neovim
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# NEO4J
export NEO4J=$HOME/.local/sources/neo4j/bin
export PATH=$PATH:$NEO4J

# NEO4J
export GOPATH=$HOME/.local/go
export PATH=$PATH:$GOPATH/bin

#Vault
export VAULT_ADDR='http://127.0.0.1:8200'
