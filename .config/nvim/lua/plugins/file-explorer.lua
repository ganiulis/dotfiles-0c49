return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
	'DaikyXendo/nvim-material-icon',
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    local map = require("utils.map")
    nvim_tree_api = require("nvim-tree.api")
    map("<leader>e", function()
      if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd p")
      else
        nvim_tree_api.tree.find_file({ open = true, focus = true })
      end
    end, "Switch between the opened file or the file explorer")
    map("<C-n>", ":NvimTreeToggle<CR>", "Toggle file explorer")
    map("<C-c>", ":NvimTreeCollapse<CR>", "Collapse file explorer")
  end,
}
