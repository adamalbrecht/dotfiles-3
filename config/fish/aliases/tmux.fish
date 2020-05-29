function tmux
  command tmux -2 $argv
end
function tml
  command tmux list-sessions $argv
end
function tma
  command tmux attach -dt $argv
end
function tmuxown
  command tmux detach -a $argv
end
function mux
  command tmuxinator $argv
end
