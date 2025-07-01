# prefix is control backtick
unbind C-b
set -g prefix `
bind ` send-prefix

# panes and windows start at 1
set -g base-index 1
set -g pane-base-index 1

# colors
set -g default-terminal "${TERM}"
set -sg terminal-overrides ",*:RGB"
set -g status-style "bg=default,fg=colour8"

# refresh
bind r source-file ~/.tmux.conf

# bar
set -g status-right "#S on #h"
set -g status-left ""
set -g status-position top
set -g window-status-format "*"
set -g window-status-current-format "*"
set -g window-status-current-style "fg=colour4"
set -g renumber-windows on

# panes
set -g pane-border-lines simple
set -g pane-border-style fg=colour8
bind | split-window -h
bind - split-window -v

# general
set -g mouse on
