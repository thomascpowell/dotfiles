return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end,
}
