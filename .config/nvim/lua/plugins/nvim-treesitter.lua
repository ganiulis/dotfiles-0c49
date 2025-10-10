return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    sync_install = true,
    ensure_installed = {
      "lua",
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
}
