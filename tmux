# prefix is control a
unbind C-b
set -g prefix C-a

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

# panes and windows
set -g pane-border-lines simple
set -g pane-border-style fg=colour8
bind c new-window -c "#{pane_current_path}"
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# general
set -g mouse on

# clipboard (should work on linux)
set-option -g set-clipboard on
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"

# copy mode
bind Escape copy-mode
setw -g mode-keys vi
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection-and-cancel
