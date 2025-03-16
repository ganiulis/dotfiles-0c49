return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "DaikyXendo/nvim-material-icon",
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    local map = require("utils.map")("nvim-tree")
    map({
      desc = "Switch between the opened file or the file explorer",
      key = "<leader>e",
      func = function()
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("wincmd p")
        else
          require("nvim-tree.api").tree.find_file({ open = true, focus = true })
        end
      end,
    })
    map({
      desc = "Toggle file explorer",
      key = "<C-n>",
      func = ":NvimTreeToggle<CR>",
    })
    map({
      desc = "Collapse file explorer",
      key = "<C-c>",
      func = ":NvimTreeCollapse<CR>",
    })
  end,
}
