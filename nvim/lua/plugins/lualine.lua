return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'lackluster',
        section_separators = '',
        component_separators = '',
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {},
        lualine_b = { 'mode' },
        lualine_c = { 'filename' },
        lualine_x = { {
          'diff',
          colored = false,
          symbols = { added = '+', modified = '~', removed = '-' } }
        },
        lualine_y = { 'branch' },
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
