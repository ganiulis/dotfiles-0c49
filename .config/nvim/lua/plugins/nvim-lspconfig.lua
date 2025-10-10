return {
  "neovim/nvim-lspconfig",
  init = function()
    local language_servers = {
      "bashls", -- Needs `bash-language-server`, `shellcheck`, and `shfmt`
      "luals", -- Needs `lua-language-server`
      "marksman", -- Needs `marksman` and `libicu74`
      "yamlls", -- Needs `yaml-language-server`
    }

    for _, language_server in ipairs(language_servers) do
      vim.lsp.enable(language_server)
    end

    vim.keymap.del("n", "grt")
    vim.keymap.del("n", "grr")
    vim.keymap.del("n", "gra")
    vim.keymap.del("n", "grn")
    vim.keymap.del("n", "gri")

    local map = require("map")("lsp")
    map({
      desc = "Rename",
      key = "<leader>rn",
      action = vim.lsp.buf.rename,
    })
    map({
      desc = "Code action",
      key = "<leader>ca",
      action = vim.lsp.buf.code_action,
    })
    map({
      desc = "Go to definition",
      key = "gd",
      action = vim.lsp.buf.definition,
    })
  end,
}
