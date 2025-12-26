export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export EDITOR='nvim'
export PAGER='nvim +Man!'

bindkey -v

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

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

[ -s "/Users/t/.bun/_bun" ] && source "/Users/t/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock
