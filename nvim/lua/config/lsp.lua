-- steps to installing lsp for a given file:
-- :LspInstall
-- copy format of this
-- profit

-- slightly related, steps to install treesitter support:
-- :TSInstall (lang)
-- profit

-- pyright
require'lspconfig'.pyright.setup{}

-- rust
require'lspconfig'.rust.setup{}

-- lua
require'lspconfig'.lua_ls.setup{}

-- lua
require'lspconfig'.clangd.setup{}

-- tsserver
require'lspconfig'.ts_ls.setup{}

-- cssls
require'lspconfig'.cssls.setup{}

-- go
require'lspconfig'.gopls.setup{}

-- svelte
require('lspconfig').svelte.setup{
  cmd = { "svelte-language-server", "--stdio" },
  filetypes = { "svelte" },
  root_dir = require('lspconfig.util').root_pattern("package.json", ".git"),
}

-- go
require'lspconfig'.jsonls.setup{}


