{ pkgs, ... }:

# Toolchains, LSPs

{
  home.packages = with pkgs; [
    go
    cargo
    rustc
    php
    nodejs_24
    typst

    rust-analyzer
    rustfmt
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
    ncdu
    lazygit
    tree-sitter
    gnumake
  ];
}
