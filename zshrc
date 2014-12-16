# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ajkaanbal"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias reloadeditor='cd /opt/bin/ReloadEditor/ && java -jar reload-editor.jar &'
alias memrss='while read command percent rss; do if [[ "${command}" != "COMMAND" ]]; then rss="$(bc <<< "scale=2;${rss}/1024")"; fi; printf "%-26s%-8s%s\n" "${command}" "${percent}" "${rss}"; done < <(ps -A --sort -rss -o comm,pmem,rss | head -n 11)'
alias tree='tree -C'
alias pwdc='pwd | tr -d "\n" | xsel -b'
alias ccat='pygmentize -g'
alias tm='tmux attach'
alias xm='xmodmap ~/.Xmodmap'
alias vi='vim -u ~/.vimrcmin'
alias rxvt='urxvt256c-ml'

#Require pip install http
function httpless {
    # 'httpless example.org'
        http --pretty=all --print=hb "$@" | less -R;
}
tmux_send_message(){
    tmux send-keys -t ajkaanbal:$1.0 C-z $2
}
alias tsk=tmux_send_message
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

#settings for hihglight plugin
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colored-man git virtualenv autoenv vagrant zsh-syntax-highlighting history-substring-search web-search tmux yum wd docker ssh-agent autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
HOMEBIN=$HOME/.local/bin
export PATH=$HOMEBIN:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin

export HISTSIZE=100000
export SAVEHIST=100000
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


# Android-sdk
export ANDROID_TOOLS="/home/rvilchis/.local/android-sdk-linux/tools"
export ANDROID_PLATFORM_TOOLS="/home/rvilchis/.local/android-sdk-linux/platforms/"
PATH=$PATH:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS

#Virtual env wrapper
export WORKON_HOME=~/.pyenvs
source /usr/bin/virtualenvwrapper.sh
#Autoenv
source /usr/bin/activate.sh

#java vars
export JAVA_HOME="/usr/java/latest"
export JDK_HOME

## Fasd
#eval "$(fasd --init auto)"
#alias v='f -e vim' # quick opening files with vim
#alias m='f -e mplayer' # quick opening files with mplayer
#alias o='a -e xdg-open' # quick opening files with xdg-open

#java
export JAVA_HOME="/usr/java/jdk1.7.0_60"
export PATH="$JAVA_HOME/bin:$PATH"

#scala
SCALA_HOME="$HOME/.local/scala"
export PATH="$SCALA_HOME/bin:$PATH"

#NODEJS
NODE_PATH="$HOME/.local/node"
export PATH="$NODE_PATH/bin:$PATH"

#GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#Editor
export EDITOR=~/.local/bin/vim
# bind UP and DOWN arrow keys
#History search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Ruby RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"
rvm use >& /dev/null

#R
export R_LIBS="$HOME/.R"

#remap keybind for clear screen
bindkey '^@' clear-screen

# unbind some keys used in tmux
bindkey -r '^[l'
bindkey -r '^[h'

#coloritos
eval `dircolors $HOME/.dir_colors`

# zsh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa jkop-ajkaanbal jkop-github

# Setup zsh-autosuggestions
source /home/rvilchis/.oh-my-zsh/plugins/autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
