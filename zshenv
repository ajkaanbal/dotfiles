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

# GOLANG
export GOPATH=$HOME/go
export GOROOT=$HOME/.local/sources/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

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
