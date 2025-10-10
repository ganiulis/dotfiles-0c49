return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    html = { enabled = false },
    latex = { enabled = false },
    yaml = { enabled = false },
    completions = { lsp = { enabled = true } },
  },
  config = function(_, opts) require("render-markdown").setup(opts) end,
}
