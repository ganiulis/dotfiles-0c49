return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  opts = {
    lazy = false,
    sync_install = true,
    ensure_installed = {
      "c",
      "go",
      "gomod",
      "gosum",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
    },
  },
  config = function(_, opts)
    if vim.fn.executable("nixos-rebuild") == 1 then
      opts.ensure_installed = {}
      opts.auto_install = false
      opts.sync_install = false
    end

    require("nvim-treesitter").setup(opts)
  end,
}
