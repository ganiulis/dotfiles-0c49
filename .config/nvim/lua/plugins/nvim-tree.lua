return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
    })

    local plugin_api = require("nvim-tree.api")
    local map = require("map")("nvim-tree")
    map({
      desc = "Focus on file or file explorer",
      key = "<leader>e",
      action = function()
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("wincmd p")
        else
          plugin_api.tree.focus()
        end
      end,
    })
    map({
      desc = "Focus on file or file in explorer",
      key = "<leader>f",
      action = function()
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("wincmd p")
        else
          plugin_api.tree.find_file({ open = true, focus = true })
        end
      end,
    })
    map({
      desc = "Toggle file explorer",
      key = "<C-n>",
      action = plugin_api.tree.toggle,
    })
    map({
      desc = "Collapse file explorer",
      key = "<C-c>",
      action = plugin_api.tree.collapse_all,
    })

    vim.fn.timer_start(0, function() plugin_api.tree.toggle(false, true) end)
  end,
}
