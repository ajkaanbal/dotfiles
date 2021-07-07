# Defined in - @ line 1
function tm --wraps='tmux attach-session -t ajk' --description 'alias tm=tmux attach-session -t ajk'
  tmux attach-session -t ajk $argv;
end
