#source ~/.antigen.zsh
#antigen bundle robbyrussell/oh-my-zsh lib/
#antigen bundle git
#antigen bundle gitfast
#antigen bundle virtualenv
#antigen bundle virtualenvwrapper
#antigen bundle tmux
#antigen bundle yum
#antigen bundle wd
#antigen bundle ssh-agent
#antigen bundle nvm
#antigen bundle z
#antigen bundle safe-paste
#antigen bundle extract
#antigen bundle docker
#antigen bundle gitignore
#antigen bundle aws
## antigen bundle kubectl
#antigen bundle Tarrasch/zsh-autoenv
#antigen bundle mafredri/zsh-async
## antigen bundle sindresorhus/pure
#antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zaw
#antigen theme ajkaanbal/dotfiles ajkaanbal.zsh-theme
## PROMPT='%(12V.%F{242}%12v%f .)'
## PROMPT+='%(?.%F{034}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '

#alias pwdc='pwd | tr -d "\n" | xsel -b'
#alias tm='tmux attach'
#alias vim='vim -u NONE'

#setopt BANG_HIST # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY # Write the history file in the ":start:elapsed;command" format.
#setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY # Share history between all sessions.
#setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
#setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
#setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
#setopt HIST_FIND_NO_DUPS # Do not display a line previously found.
#setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
#setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
#setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
#setopt HIST_VERIFY # Don't execute immediately upon history expansion.
#antigen apply


##History search
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

#bindkey '^P' history-substring-search-up
#bindkey '^N' history-substring-search-down

##remap keybind for clear screen
#bindkey '^@' clear-screen

## unbind some keys used in tmux
#bindkey -r '^[l'
#bindkey -r '^[h'

##coloritos
#if whence dircolors >/dev/null; then
#  eval `dircolors $HOME/.dir_colors`
#  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#else
#  export CLICOLOR=1
#  zstyle ':completion:*:default' list-colors ''
#fi

## [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_COMMAND='ag -g ""'


##### Custom functions
#source ~/.zshrc.local
## some git help
#function yesterworkday()
#{
#    if [[ "1" == "$(date +%u)" ]]
#    then
#        echo "last friday"
#    else
#        echo "yesterday"
#    fi
#}


## git log --since="$(yesterworkday)"


##Random string
#function genkey() {
#    size=32
#    if [ -z "$1" ]; then
#        size=32
#    else
#        size=$1
#    fi

#    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-$size} | head -n 1
#}

## kubectl completition
## if [ $commands[kubectl] ]; then
#  # source <(kubectl completion zsh)
## fi

#autoload -Uz compinit
#compinit
#setopt complete_in_word

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##azure completition
## source "$HOME/.local/lib/azure-cli/az.completion"

#export PATH=$HOME/.local/bin/luna-studio:$PATH

#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /home/rvilchis/.local/bin/vault vault
#autoload -U compinit
#fpath=($HOME/.bloop/zsh $fpath)
#compinit


## AWS
## source ~/.local/h
## source $HOME/.local/bin/aws_zsh_completer.sh
#export FURYHOME=/home/rvilchis/.local/bin/fury && source ~/.furyrc/zsh # Added by Fury

###############################################################################
# ZPLUG
###############################################################################
source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitfas", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/nvm", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/kube-ps1", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh

zplug "lib/history", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "lib/nvm", from:oh-my-zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zaw"

zplug "ahmetb/kubectx", as:command, use:"kubens"
zplug "ahmetb/kubectx", as:command, use:"kubectx"

zplug "~/.zsh", from:local, defer:3
zplug 'ajkaanbal/dotfiles', use:"ajkaanbal.zsh-theme", as:theme, defer:3

zplug load

alias pwdc='pwd | tr -d "\n" | xsel -b'
alias tm='tmux attach'
alias vim='vim -u NONE'
alias v=nvim

setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS # Do not display a line previously found.
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.


#History search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

#remap keybind for clear screen
bindkey '^@' clear-screen

# unbind some keys used in tmux
bindkey -r '^[l'
bindkey -r '^[h'

#coloritos
if whence dircolors >/dev/null; then
  eval `dircolors $HOME/.dir_colors`
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

# enable direnv
eval "$(direnv hook zsh)"
