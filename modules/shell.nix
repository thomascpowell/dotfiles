{ pkgs, ... }:

# CLI tools

{
  home.packages = with pkgs; [
    git
    tmux
    yazi
    neovim
    starship
    fastfetch
    btop
    fd
    fzf
    tree
    zoxide
  ];

  home.file.".local/bin" = {
    source = ../scripts;
    recursive = true;
  };

  home.file.".config/git".source = ../config/git;
  home.file.".config/tmux".source = ../config/tmux;
  home.file.".config/yazi".source = ../config/yazi;
  home.file.".zshrc".source = ../config/zsh/.zshrc;
  home.file.".config/starship.toml".source = ../config/starship.toml;
  home.file.".config/fastfetch".source = ../config/fastfetch;
  home.file.".config/nvim/lua".source = ../config/nvim/lua;
  home.file.".config/nvim/init.lua".source = ../config/nvim/init.lua;
}
