-- pyright
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.autopep8.setup {}

-- lua
require 'lspconfig'.lua_ls.setup {}

-- lua
require 'lspconfig'.clangd.setup {}

vim.lsp.enable("millet")

-- tsserver
require 'lspconfig'.ts_ls.setup {}

-- cssls
require 'lspconfig'.cssls.setup {}

-- svelte
vim.lsp.enable("svelte")

-- json
require 'lspconfig'.jsonls.setup {}

-- docker
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.docker_compose_language_service.setup {}
