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
vim.cmd([[ hi NotifyBackground guibg = #000000 ]])
vim.cmd [[hi VertSplit guifg=NONE]]

-- removes tildes
vim.opt.fillchars = {eob = " "}

-- adds line numbers
vim.cmd[[set number]]

-- removes yap session
vim.cmd[[set shortmess=I]]
-- vim.opt.shortmess:append("csCFSW")
vim.opt.shortmess:append("atIcCfsSFW")

-- hide default status bar
vim.cmd[[set cmdheight=0]]

-- nowrap
vim.cmd [[set nowrap]]

-- tabs & indentation
local opt = vim.opt
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

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
