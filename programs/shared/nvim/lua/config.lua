vim.g.mapleader = " "

-- cycle through buffers
vim.keymap.set("n", "<leader><tab>", ":b<space><Tab>")

-- go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- format
vim.keymap.set("n", "<leader>lf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format with Conform" })

vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, vim.opts)

-- code action
vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, vim.opts)

-- diagnostic
vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.open_float(nil, {
    border = "rounded",
  })
end, vim.opts)

-- info
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({
    border = "rounded"
  })
end, { noremap = true, silent = true })

-- recording notification
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.notify("Recording @" .. vim.fn.reg_recording(), vim.log.levels.INFO)
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.notify("Stopped recording")
  end,
})

-- styles
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", })
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.shortmess = "IatIcCfsSFW"
vim.opt.cmdheight = 0
vim.opt.wrap = false

-- statusline
vim.o.statusline = " " .. vim.o.statusline .. " "

-- spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "typst", "text" },
  callback = function()
    local opt = vim.opt_local
    opt.wrap = true
    opt.linebreak = true
    opt.breakindent = true
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })
    vim.keymap.set("v", "j", "gj", { buffer = true })
    vim.keymap.set("v", "k", "gk", { buffer = true })
  end,
})
