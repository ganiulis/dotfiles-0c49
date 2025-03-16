return {
  {
    "williamboman/mason.nvim",
    config = function(_, opts) require("mason").setup(opts) end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
      },
      auto_update = true,
      start_delay = 3000,
      debounce_hours = 1,
    },
    config = function(_, opts) require("mason-tool-installer").setup(opts) end,
  },
}
