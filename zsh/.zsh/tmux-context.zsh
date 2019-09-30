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

