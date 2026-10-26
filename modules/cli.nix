{ config, ... }:

let
  inherit (config.flake) homeModules;
in

{
  flake.homeModules.cli =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        btop
        fd
        fzf
        tree
        zoxide
        ripgrep
        ripgrep-all
        bash
        zip
        unzip
        github-cli
        gitleaks
        ncdu
        lazygit
        tree-sitter
        gnumake
        jq
        delta
      ];

      imports = [
        homeModules.fastfetch
        homeModules.git
        homeModules.nvim
        homeModules.starship
        homeModules.tmux
        homeModules.yazi
        homeModules.zsh
      ];

      home.file.".local/bin" = {
        source = ../misc/scripts;
        recursive = true;
      };
    };
}
