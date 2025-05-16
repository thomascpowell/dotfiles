-- sources thomas/remap (equivilant to :so)
require("config.remap")

-- sources thomas/lsp
require("config.lsp")

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

