return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      diagnostics = {
        auto_close = true,
        auto_open = false,
      },
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>tt",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[trouble] Open diagnostics buffer",
    },
  },
}
