return {
  'nvim-telescope/telescope.nvim',
	defaults = {
		preview = { treesitter = true },
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Telescope buffers' })
  end,
}
