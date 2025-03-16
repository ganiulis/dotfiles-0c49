return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "DaikyXendo/nvim-material-icon",
  },
  config = function(_, opts)
    local plugin = "nvim-tree"
    require(plugin).setup(opts)
    local map = require("utils.map")(plugin)
    map({
      desc = "Switch between the opened file or the file explorer",
      key = "<leader>e",
      action = function()
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("wincmd p")
        else
          require("nvim-tree.api").tree.find_file({ open = true, focus = true })
        end
      end,
      noremap = true,
      silent = true,
    })
    map({
      desc = "Toggle file explorer",
      key = "<C-n>",
      action = ":NvimTreeToggle<CR>",
    })
    map({
      desc = "Collapse file explorer",
      key = "<C-c>",
      action = ":NvimTreeCollapse<CR>",
    })
  end,
}
