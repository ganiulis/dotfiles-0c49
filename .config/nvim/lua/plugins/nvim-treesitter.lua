return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  opts = {
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
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
      },
    },
  },
  config = function(_, opts)
    if vim.fn.executable("nixos-rebuild") == 1 then
      opts["ensure_installed"] = {}
      opts["auto_install"] = false
      opts["sync_install"] = false
    end

    require("nvim-treesitter").setup(opts)

    if vim.fn.executable("nixos-rebuild") == 1 then
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "markdown",
        callback = function() vim.treesitter.start() end,
      })
    end
  end,
}
