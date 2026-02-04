return {
  {
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

      local not_installed = function(lang) return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0 end
      local to_install = {}
      if vim.fn.executable("nixos-rebuild") == 0 then to_install = vim.tbl_filter(not_installed, ensure_installed) end
      if #to_install > 0 then require("nvim-treesitter").install(to_install) end

      local filetypes = {}
      for _, lang in ipairs(ensure_installed) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
          table.insert(filetypes, ft)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Start nvim-treesitter",
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          -- You need some mechanism to avoid running on buffers that do not
          -- correspond to a language (like oil.nvim buffers). This implementation
          -- checks if a parser exists for the current language.
          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then return end

          -- Folding. May be annoying.
          -- vim.wo.foldmethod = "expr"
          -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

          -- Syntax highlighting.
          vim.treesitter.start(buf, language)

          -- Code indentation.
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
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
  },
}
