local function recording_macro()
    local reg = vim.fn.reg_recording()
    if reg == "" then
        return ""
    else
        return "@" .. reg
    end
end


return {
    'nvim-lualine/lualine.nvim',
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
                    refresh_time = 32,
                }
            },
            sections = {
                lualine_a = {},
                lualine_b = { 'mode', 'branch', recording_macro },
                lualine_c = {},
                lualine_x = { {
                    'diff',
                    colored = false,
                    symbols = { added = '+', modified = '~', removed = '-' } }
                },
                lualine_y = { 'filename', 'diagnostics' },
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
}
