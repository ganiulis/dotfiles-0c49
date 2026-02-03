-- Lightweight yet powerful formatter plugin for Neovim
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "gofumpt" },
      lua = { "stylua" },
      markdown = { "prettier" },
      nix = { "nixfmt" },
      yaml = { "yamlfmt" },
    },
    format_on_save = {
      timeout_ms = 1500,
      lsp_format = "fallback",
    },
  },
}
