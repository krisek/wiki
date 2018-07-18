# tmux cheat sheet

## command line

tmux ls
tmux attach -t 0
tmux new -s database
tmux rename-session -t 0 database
tmux attach -t database


## configuration

set-option -g mouse on | mouse support
set -g history-limit 999999999 | "unlimited" history


## shortcuts

C-b c | new pane
C-b n | next pane
C-b p | prev pane
C-b [1-9] | switch to pane
C-b  % | split panes vertically
C-b " | split panes horizontally
C-b z | expand current (split) pane; pressing it again restores the pane
C-b k | kill pane
C-b d | detach tmux
