#!/bin/bash
set -euo pipefail

# A simple script for linking my configurations.

# Locations
DOTFILES="$HOME/dotfiles"
TARGET="$HOME/.config"

# Directories to be linked
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

symlink() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  echo ""
  # remove existing file or symlink
  if [ -e "$dest" ] || [ -L "$dest" ]; then
      rm -rf "$dest"
      echo "removed existing: $dest"
  fi
  ln -s "$src" "$dest"
  echo "linked: $src -> $dest"
  echo ""
}

# Symlinking configurations
# (In order of least to most irritating to automate)

# Normal programs (XDG)
for dir in "${DIRS[@]}"; do
  symlink "$DOTFILES/$dir" "$TARGET/$dir"
done

# Programs that want to be different sooo bad
symlink "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
symlink "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
symlink "$DOTFILES/starship/starship.toml" "$TARGET/starship.toml"

# Firefox.
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
while IFS= read -r PROFILE; do
  [ -d "$PROFILE" ] || continue
  echo "updating firefox profile: $PROFILE"
  mkdir -p "$PROFILE/chrome"
  symlink "$DOTFILES/firefox/firefox.css" "$PROFILE/chrome/userChrome.css"
done < <(get_firefox_profiles)
