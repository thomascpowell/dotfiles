local langs = { "typescript", "javascript", "html", "css", "svelte", "rust", "lua", "python", "c", "markdown", "bash", "php" }

vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
	callback = function() vim.treesitter.start() end,
})
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = langs,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
