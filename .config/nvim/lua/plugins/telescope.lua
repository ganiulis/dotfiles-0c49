return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function(_, opts)
    local plugin_name = "telescope"

    require(plugin_name).setup(opts)
    local builtin = require("telescope.builtin")

    local map = require("map")(plugin_name)
    map({
      desc = "Search for files",
      key = "<leader>tf",
      action = builtin.find_files,
    })
    map({
      desc = "Search for words",
      key = "<leader>tw",
      action = builtin.live_grep,
    })
    map({
      desc = "Search for buffers",
      key = "<leader>tb",
      action = builtin.buffers,
    })
    map({
      desc = "Search help",
      key = "<leader>th",
      action = builtin.help_tags,
    })
    map({
      desc = "Find references",
      key = "gr",
      action = builtin.lsp_references,
    })
    map({
      desc = "Go to implementation",
      key = "gi",
      action = builtin.lsp_implementations,
    })
  end,
}
