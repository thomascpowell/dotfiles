return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>,', builtin.buffers, {})
    end,
}
