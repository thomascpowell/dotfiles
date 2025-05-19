-- steps to installing lsp for a given file:
-- :LspInstall
-- copy format of this
-- profit

-- slightly related, steps to install treesitter support:
-- :TSInstall (lang)
-- profit

-- pyright
require'lspconfig'.pyright.setup{}

-- lua
require'lspconfig'.lua_ls.setup{}

-- tsserver
require'lspconfig'.ts_ls.setup{}

-- cssls
require'lspconfig'.cssls.setup{}

-- go
require'lspconfig'.gopls.setup{}
