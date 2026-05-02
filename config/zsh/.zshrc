. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export EDITOR='nvim'
export PAGER='less'

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

bindkey -v
alias td='tmux detach'
alias ta='tmux attach -t'
alias trs='tmux rename-session'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
[[ "$(uname -s)" == "Linux" ]] && alias cb='xclip -selection clipboard'
[[ "$(uname -s)" == "Linux" ]] && alias open='xdg-open';

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.nix-profile/bin:$PATH"

eval fastfetch
