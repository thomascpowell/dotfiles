-- remaps that apply in md files, for writing purposes

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "typst" },
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
