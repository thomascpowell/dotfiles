# prefix is control space
unbind C-Space
set -g prefix C-Space
bind C-Space send-prefix

# panes and windows start at 1
set -g base-index 1
set -g pane-base-index 1

# colors (matches lualine)
set -g status-style "bg=#242424,fg=#AAAAAA"

# refresh
bind r source-file ~/.tmux.conf

# bar
set -g status-right "#h "
set -g status-left " "
