# tmux cheat sheet

## shortcuts

C: Ctrl by default

shortcut | description
------------ | -------------
`C-b c` | new pane
`C-b n` | next pane
`C-b p` | prev pane
`C-b [1-9]` | switch to pane
`C-b  %` | split panes vertically
`C-b "` | split panes horizontally
`C-b z` | expand current (split) pane; pressing it again restores the pane
`C-b k` | kill pane
`C-b d` | detach tmux

## command line

command | description
------------ | -------------
`tmux ls` | list sessions
`tmux attach -t 0` | attach to session 0
`tmux attach -t database` | attach to named session
`tmux new -s database` | create a new session called database
`tmux rename-session -t 0 database` | rename session

## configuration

option | effect
------------ | -------------
`set-option -g mouse on` | mouse support
`set -g history-limit 999999999` |  "unlimited" history
