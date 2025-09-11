# auto complete
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'
plugins=(git)

# yazi alias to y and changes dir
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# tmux 
alias td='tmux detach'
alias ta='tmux attach -t'
alias trs='tmux rename-session'

# git
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# smlnj
export PATH="/usr/local/smlnj/bin:$PATH"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^I' autosuggest-accept

# bun completions
[ -s "/Users/t/.bun/_bun" ] && source "/Users/t/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

