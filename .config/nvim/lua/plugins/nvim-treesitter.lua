return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
