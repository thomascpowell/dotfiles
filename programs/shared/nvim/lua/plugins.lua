vim.pack.add({
  { src = "https://github.com/slugbyte/lackluster.nvim" },
  { src = "https://github.com/m4xshen/autoclose.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-mini/mini.icons" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" }
})

-- lsp
vim.lsp.enable({ "svelte", "ts_ls", "html", "emmetls", "cssls", "phpactor", "gopls", "lua_ls", "pyright", "clangd",
  "rust_analyzer", "bashls", "tinymist" })

-- colorscheme
local lackluster = require("lackluster")

lackluster.setup({
  tweak_background = {
    normal = 'none',
    telescope = 'none',
  },
  tweak_syntax = {
    comment = lackluster.color.gray6,
  },
})
vim.cmd.colorscheme("lackluster")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })

-- autoclose
require("autoclose").setup()

-- icons
require("mini.icons").setup()

-- oil
require("oil").setup({
  delete_to_trash = true,
})

-- treesitter
local default_parsers = { "typescript", "javascript", "css", "svelte", "rust", "python", "c", "bash", "php", 'diff',
  'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', "typst" }
require("nvim-treesitter").setup({
  ensure_installed = default_parsers,
  highlight = { enable = true },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = default_parsers,
  callback = function() vim.treesitter.start() end,
})

-- telescope
local telescope = require("telescope")
telescope.setup({
  defaults = { preview = { treesitter = true } }
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set("n", "<leader>m", builtin.builtin, { desc = 'Telescope (meta)' })

-- whichkey
require("which-key").setup()

-- blink
require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
  completion = {
    menu = { border = "rounded" },
    documentation = { window = { border = "rounded" } },
  },

  -- ~/.local/share/nvim/site/pack/core/opt/blink.cmp
  fuzzy = { implementation = "prefer_rust_with_warning" },

  sources = { default = { "lsp", "buffer", "path", "snippets" } },
  snippets = { preset = "luasnip" },

  keymap = {
    preset = "default",
    ["<C-j>"] = { "select_next" },
    ["<C-k>"] = { "select_prev" },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ["<Tab>"] = { "accept", "fallback" },
  },
})

vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#2A2A2A" })
