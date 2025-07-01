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
set -g status-right "#h"
set -g status-left ""
