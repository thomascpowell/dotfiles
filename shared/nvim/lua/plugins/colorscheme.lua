-- theme

return {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local lackluster = require("lackluster")
        local color = lackluster.color

        lackluster.setup({
            tweak_background = {
                normal = 'none',
                telescope = 'none',
            },
            tweak_syntax = {
                comment = color.gray6
            },
        })
        vim.cmd.colorscheme("lackluster")
    end,
}
