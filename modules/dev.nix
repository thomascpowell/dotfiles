{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # toolchains
    go
    (lib.lowPrio rustup)
    php
    nodejs_24

    # lsp
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
    nixfmt-rfc-style
  ];
}
