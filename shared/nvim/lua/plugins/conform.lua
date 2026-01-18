-- formatters

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters = {
        ruff = {
          command = "ruff",
          args = { "format", "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        python = { "ruff" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end,
}
