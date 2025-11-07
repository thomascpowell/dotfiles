require 'lspconfig'.pyright.setup {}
require 'lspconfig'.autopep8.setup {}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.clangd.setup {}
vim.lsp.enable("millet")
require 'lspconfig'.ts_ls.setup {}
require 'lspconfig'.cssls.setup {}
vim.lsp.enable("svelte")
vim.lsp.enable("sqlls")
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.phpactor.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.docker_compose_language_service.setup {}
