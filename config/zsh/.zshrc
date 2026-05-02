. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# exports
export EDITOR='nvim'
export PAGER='less'

# tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# vi mode
bindkey -v

# stupid aliases
alias td='tmux detach'
alias ta='tmux attach -t'
alias trs='tmux rename-session'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# reasonable aliases
alias cb='xclip -selection clipboard'
[[ "$(uname -s)" == "Linux" ]] && alias open='xdg-open';

# yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# zoxide and prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# path stuff
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.nix-profile/bin:$PATH"

eval fastfetch
