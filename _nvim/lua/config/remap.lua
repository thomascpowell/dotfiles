vim.g.mapleader = " "

-- example remap: while in normal mode, leaderpv executes :Ex
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- toggle nvim-tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)


vim.keymap.set("n", "<leader><tab>", ":b<space><Tab>")
