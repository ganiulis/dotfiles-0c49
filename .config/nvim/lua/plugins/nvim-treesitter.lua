return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  config = function()
    local ensure_installed = {
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
    }

    local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0 end
    local to_install = {}
    if vim.fn.executable("nixos-rebuild") == 0 then to_install = vim.tbl_filter(isnt_installed, ensure_installed) end
    if #to_install > 0 then require("nvim-treesitter").install(to_install) end

    local filetypes = {}
    for _, lang in ipairs(ensure_installed) do
      for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
        table.insert(filetypes, ft)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Start nvim-treesitter",
      group = vim.api.nvim_create_augroup("start_treesitter", { clear = true }),
      pattern = filetypes,
      callback = function(ev) vim.treesitter.start(ev.buf) end,
    })
  end,
}
