return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader><leader>', builtin.git_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Telescope buffers' })
    end,
}
