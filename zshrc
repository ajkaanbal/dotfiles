# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="fino"
ZSH_THEME="ajkaanbal"
#ZSH_THEME="trapd00r"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv history-substring-search zsh-syntax-highlighting git tmux wd autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
HOMEBIN=/home/ajkaanbal/.local/bin
export PATH=$HOMEBIN:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin

# Custom alisa
alias memrss='while read command percent rss; do if [[ "${command}" != "COMMAND" ]]; then rss="$(bc <<< "scale=2;${rss}/1024")"; fi; printf "%-26s%-8s%s\n" "${command}" "${percent}" "${rss}"; done < <(ps -A --sort -rss -o comm,pmem,rss | head -n 11)'

alias pwdc='pwd | tr -d "\n" | xsel -b'
alias tree='tree -C'
alias tm='tmux attach'
tmux_send_message(){
    tmux send-keys -t ajkaanbal:$1.0 C-z $2
}
alias tsk=tmux_send_message

#Vimgolf
alias vimg='vim -u ~/.vimgolf.vimrc'


# Android-sdk
export ANDROID_TOOLS="$HOME/.local/adt/sdk/tools"
export ANDROID_PLATFORM_TOOLS="$HOME/.local/adt/sdk/platform-tools/"
PATH=$PATH:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS

#Virtual env wrapper
export WORKON_HOME=~/.pyenvs
source /usr/bin/virtualenvwrapper.sh
source /usr/bin/activate.sh

#java vars
export JAVA_HOME="/usr/java/latest"
export JDK_HOME

## Fasd
#eval "$(fasd --init auto)"
#alias v='f -e vim' # quick opening files with vim
#alias m='f -e mplayer' # quick opening files with mplayer
#alias o='a -e xdg-open' # quick opening files with xdg-open

#History search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Ruby RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"
rvm use >& /dev/null

# Enable autosuggestions automatically
zle-line-init() {
        zle autosuggest-start

}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
