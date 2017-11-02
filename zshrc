source ~/.antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle git
antigen bundle gitfast
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle tmux
antigen bundle yum
antigen bundle wd
antigen bundle ssh-agent
antigen bundle nvm
antigen bundle z
antigen bundle safe-paste
antigen bundle extract
antigen bundle docker
antigen bundle gitignore
antigen bundle Tarrasch/zsh-autoenv
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zaw
antigen theme ajkaanbal/dotfiles ajkaanbal.zsh-theme

alias pwdc='pwd | tr -d "\n" | xsel -b'
alias tm='tmux attach'

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'


#### Custom functions
source ~/.zshrc.local
# some git help
function yesterworkday()
{
    if [[ "1" == "$(date +%u)" ]]
    then
        echo "last friday"
    else
        echo "yesterday"
    fi
}

# git log --since="$(yesterworkday)"

# c short for context
function c() {
  if [ -n "$1" ]; then
    local SESSION=$(tmux list-sessions | awk '{ print $1 }' | grep $1)
  fi
  # If no arguments, list sessions
  if [ -z "$1" ]; then
    tmux list-sessions
  # If not in tmux, but session exists; attach
  elif [ -z "$TMUX" ] && [ -n "$SESSION" ]; then
    tmux attach -t $1
  # If in tmux, and session exists, switch to session
  elif [ -n "$TMUX" ] && [ -n "$SESSION" ]; then
    tmux switch-client -t $1
  # If in tmux, and session does not exists, create detached session in subshell and switch to it
  elif [ -n "$TMUX" ]; then
    tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dPs "$1")"
  # Otherwise just create new session
  else
    tmux new-session -s "$1"
  fi
}

_c_complete() {
    local WORD=${COMP_WORDS[COMP_CWORD]}
    local CANDIDATES=$(tmux ls 2>/dev/null | sed 's/^\([^:]\+\):.*$/\1/' | sort -u)

    reply=( "${(ps:\n:)CANDIDATES}" )
}
compctl -K _c_complete c

#Random string
function genkey() {
    size=32
    if [ -z "$1" ]; then
        size=32
    else
        size=$1
    fi

    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-$size} | head -n 1
}

autoload -Uz compinit
compinit
setopt complete_in_word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
