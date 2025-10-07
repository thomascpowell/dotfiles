# prefix is control a
unbind C-b
set -g prefix C-a

# no delay after prefix
set -s escape-time 0

# panes and windows start at 1
set -g base-index 1
set -g pane-base-index 1

# colors
set -sg terminal-overrides ",*:RGB"
set -g status-style "bg=default,fg=colour8"
set-option -g mode-style "bg=colour8,fg=default"

# refresh
bind r source-file ~/.tmux.conf

# bar
set -g status-right "#S"
set -g status-left ""
set -g status-position top
set -g window-status-format "•"
set -g window-status-current-format "•"

set -g window-status-current-style "fg=colour7"
set -g renumber-windows on

set -g pane-border-style fg=colour8
set -g pane-active-border-style fg=colour8
bind c new-window -c "#{pane_current_path}"
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# pane nav
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

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

