export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export EDITOR='nvim'

# diable this
bindkey -e

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
 
alias td='tmux detach'
alias ta='tmux attach -t'
alias trs='tmux rename-session'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# smlnj for some reason
export PATH="/usr/local/smlnj/bin:$PATH"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# bun 
[ -s "/Users/t/.bun/_bun" ] && source "/Users/t/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# colima
export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock

# auto complete
# source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
# bindkey '^I' autosuggest-accept
# plugins=(git)
