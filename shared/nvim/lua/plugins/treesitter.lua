return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  tag = "v0.10.0",
  opts = {
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
