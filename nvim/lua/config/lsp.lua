-- pyright
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.autopep8.setup {}
-- rust
require 'lspconfig'.rust_analyzer.setup {}

-- lua
require 'lspconfig'.lua_ls.setup {}

-- lua
require 'lspconfig'.clangd.setup {}

-- tsserver
require 'lspconfig'.ts_ls.setup {}

-- cssls
require 'lspconfig'.cssls.setup {}

-- go
require 'lspconfig'.gopls.setup {}

-- svelte
require('lspconfig').svelte.setup {
  cmd = { "svelte-language-server", "--stdio" },
  filetypes = { "svelte" },
  root_dir = require('lspconfig.util').root_pattern("package.json", ".git"),
}

-- json
require 'lspconfig'.jsonls.setup {}

-- docker
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.docker_compose_language_service.setup {}
