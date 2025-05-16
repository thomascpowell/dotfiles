return {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        require("lackluster").setup({
          tweak_background = {
            normal = 'none',
            telescope = 'none',
          },
        })
        vim.cmd.colorscheme("lackluster")
        -- vim.cmd.colorscheme("lackluster-hack")
        -- vim.cmd.colorscheme("lackluster-mint")
    end,
}

-- poimanders or somthing idk
-- return {
--   'olivercederborg/poimandres.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('poimandres').setup {
--       disable_background = true, -- disable background
--       disable_float_background = true,
--     }
--   end,
--
--   -- optionally set the colorscheme within lazy config
--   init = function()
--     vim.cmd [[colorscheme poimandres]]
--   end
-- }


-- rasmus
--   -- url
--   'kvrohit/rasmus.nvim',
--   priority = 1000,
--   -- this gets run on load
--   config = function()
--     vim.g.rasmus_transparent = true
--     vim.cmd [[colorscheme rasmus]]
--   end,
-- }

-- noclown 
-- return {
--   "aktersnurra/no-clown-fiesta.nvim",
--   priority = 1000,
--   config = function()
--     require("no-clown-fiesta").setup({
--       transparent = true,
--       styles = {
--         comments = {},
--         functions = {},
--         keywords = {},
--         lsp = { underline = true },
--         match_paren = {},
--         type = { bold = true },
--         variables = {},
--       },
--     })
--     vim.cmd [[colorscheme no-clown-fiesta]]
--   end,
-- }

-- return {
--   "vague2k/vague.nvim",
--   config = function()
--     require("vague").setup({
--       transparent = true,
--     })
--     vim.cmd[[colorscheme vague]]
--   end
-- }


