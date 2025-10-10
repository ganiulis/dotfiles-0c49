-- Lightweight yet powerful formatter plugin for Neovim
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      markdown = { "prettier" },
      yaml = { "yamlfmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
