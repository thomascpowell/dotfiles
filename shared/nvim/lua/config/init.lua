-- basic setup

require("config.remap")
require("config.lsp")
require("config.md")
require("config.lazy")

-- styles
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", })

-- ui
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.shortmess = "IatIcCfsSFW"
vim.opt.cmdheight = 0
vim.opt.wrap = false

-- spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- behavior
vim.opt.clipboard:append("unnamedplus")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
