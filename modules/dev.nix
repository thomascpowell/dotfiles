{ pkgs, lib, ... }:

# Toolchains, LSPs, etc.

{
  home.packages = with pkgs; [
    go
    (lib.lowPrio rustup)
    php
    nodejs_24
    typst

    rust-analyzer
    pyright
    typescript-language-server
    svelte-language-server
    vscode-langservers-extracted
    emmet-ls
    gopls
    lua-language-server
    clang-tools
    phpactor
    bash-language-server
    tinymist
    nixd
    nixfmt

    github-cli
    gitleaks
    acpi
    ncdu
    lazygit
  ];
}
