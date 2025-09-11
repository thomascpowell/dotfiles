vim.g.mapleader = " "


-- toggle nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)


-- cycle through buffers
vim.keymap.set("n", "<leader><tab>", ":b<space><Tab>")

-- lsp binds
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>lf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format with Conform" })

vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)

vim.keymap.set("n", "<leader>k", function() vim.diagnostic.open_float() end, opts)

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({
    border = "rounded"
  })
end, { noremap = true, silent = true })
