-- sources remap (equivilant to :so)
require("config.remap")

-- sources lsp
require("config.lsp")

-- sources md writing config
require("config.md")

-- sources lazy
require("config.lazy")

-- styles
vim.opt.termguicolors = true
vim.cmd [[hi VertSplit guifg=NONE]]
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", })

-- removes tildes
vim.opt.fillchars = { eob = " " }

-- adds line numbers
vim.cmd [[set number]]

-- removes yap session
vim.cmd [[set shortmess=I]]
vim.opt.shortmess:append("atIcCfsSFW")

-- hide default status bar
vim.cmd [[set cmdheight=0]]

-- nowrap
vim.cmd [[set nowrap]]

-- tabs & indentation
local opt = vim.opt
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- make clipboard work as expected
opt.clipboard:append("unnamedplus")

-- show the diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
