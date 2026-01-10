-- formatters

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end,
}
