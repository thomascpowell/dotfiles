#!/bin/bash
set -euo pipefail

# configuration
DOTFILES="$HOME/dotfiles"
TARGET="$HOME/.config"

symlink() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  # remove existing file or symlink
  if [ -e "$dest" ] || [ -L "$dest" ]; then
      rm -rf "$dest"
      echo "removed existing: $dest"
  fi
  ln -s "$src" "$dest"
  echo "linked: $src -> $dest"
}

get_firefox_profiles() {
  local base
  if [ -d "$HOME/Library/Application Support/Firefox/Profiles" ]; then
      base="$HOME/Library/Application Support/Firefox/Profiles"
  elif [ -d "$HOME/.mozilla/firefox" ]; then
      base="$HOME/.mozilla/firefox"
  else
      return
  fi
  printf '%s\n' "$base"/*.default*
}

DIRS=(
  "fastfetch"
  "gh"
  "karabiner"
  "aerospace"
  "firefox"
  "ghostty"
  "nvim"
  "yazi"
)

for dir in "${DIRS[@]}"; do
  symlink "$DOTFILES/$dir" "$TARGET/$dir"
done

symlink "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
symlink "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
symlink "$DOTFILES/starship/starship.toml" "$TARGET/starship.toml"

for PROFILE in $(get_firefox_profiles); do
    echo "updating firefox profile: $PROFILE"
    mkdir -p "$PROFILE/chrome"
    symlink "$DOTFILES/firefox/firefox.css" "$PROFILE/chrome/userChrome.css"
done
