vim.g.mapleader = " "

-- toggle oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- cycle through buffers
vim.keymap.set("n", "<leader><tab>", ":b<space><Tab>")

-- go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

-- format
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format with Conform" })

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
