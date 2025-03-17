return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "prettier",
      "stylua",
      "lua-language-server",
    },
    auto_update = true,
    start_delay = 3000,
    debounce_hours = 1,
  },
  config = function(_, opts) require("mason-tool-installer").setup(opts) end,
}
