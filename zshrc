# auto complete
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"


plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^I' autosuggest-accept
