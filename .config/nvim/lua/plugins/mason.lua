return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "gopls",
      "gofumpt",
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
  enabled = function() return vim.fn.executable("nixos-rebuild") == 0 end,
  config = function(_, opts)
    require("mason").setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      local packages = table.concat(opts.ensure_installed, " ")
      vim.cmd("MasonInstall " .. packages)
    end, {})
  end,
}
