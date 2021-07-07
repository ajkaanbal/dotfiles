# useful link https://gist.github.com/zuigon/8852793

# set -g fish_key_bindings fish_vi_key_bindings
# set -g fish_vi_force_cursor
# set -g fish_cursor_default block
# set fish_cursor_insert line
# # Set the replace mode cursor to an underscore
# set fish_cursor_replace_one underscore
# # The following variable can be used to configure cursor shape in
# # visual mode, but due to fish_cursor_default, is redundant here
# set fish_cursor_visual block

bind -M insert \ce end-of-line
bind -M default \cp history-search-backward
bind -M default \cn history-search-forward
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward


#emacs mode
set -g fish_key_bindings fish_default_key_bindings
# echo -ne "\e[6 q"
# printf '\033[5 q\r'

bind \e\[A history-search-backward
bind \e\[B down-or-search
bind -k down down-or-search
bind -k up history-search-backward

bind \cw backward-kill-word

# fish_greeting is a noop
# disables Alt+v
bind \ev fish_greeting

# Ignore some known-bad control sequences
# https://github.com/fish-shell/fish-shell/issues/1917
# bind --preset \e\[I 'begin;end'
# bind --preset \e\[O 'begin;end'
bind --preset -M default \e\[I 'emit fish_focus_in'
bind --preset -M default \e\[O false
bind --preset -M default \e\[\?1004h false


#Global exports
set --global --export EDITOR nvim
set --global --export JAVA_HOME $HOME/.cache/coursier/jvm/graalvm-java11@21.1.0
set --global --export PATH $JAVA_HOME/bin:$PATH

beam > /dev/null

direnv hook fish | source

