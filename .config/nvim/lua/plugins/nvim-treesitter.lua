return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
