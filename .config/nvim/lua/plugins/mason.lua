return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "bash-language-server",
      "fish-lsp",
      "lua-language-server",
      "marksman",
      "prettier",
      "shellcheck",
      "shfmt",
      "stylua",
      "yaml-language-server",
      "yamlfmt",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      local packages = table.concat(opts.ensure_installed, " ")
      vim.cmd("MasonInstall " .. packages)
    end, {})
  end,
}
