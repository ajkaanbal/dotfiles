# Defined in /tmp/fish.r5vtdG/c.fish @ line 2

# Borrowed from /usr/share/fish/completions/tmux.fish because I don't know how to reuse it
function __fish_tmux_sessions -d 'available sessions'
    tmux list-sessions -F "#S	#{session_windows} windows created: #{session_created_string} [#{session_width}x#{session_height}]#{session_attached}" | sed 's/0$//;s/1$/ (attached)/' 2>/dev/null
end

function c
    if test -n "$argv[1]"
        set session (tmux list-sessions -F '#{session_name}' | ag -w "$argv[1]")
    end
    # If no arguments, list sessions
    if test -z "$argv[1]"
        tmux list-sessions
    # If not in tmux, but session exists; attach
    else if test -z "$TMUX"
        and test -n "$session"
        tmux attach -t $argv[1]
    # If in tmux, and session exists, switch to session
    else if test -n "$TMUX"
        and test -n "$session"
        tmux switch-client -t $argv[1]
    # If in tmux, and session does not exists, create detached session in subshell and switch to it
    else if test -n "$TMUX"
        set -l socket_path (echo $TMUX | awk -F, '{print $1}')
        tmux switch-client -t (TMUX= tmux -S "$socket_path" new-session -dPs "$argv[1]")
    # Otherwise just create new session
    else
        tmux new-session -s "$argv[1]"
    end
end

complete -c c -f
complete -c c -a '(__fish_tmux_sessions)'

