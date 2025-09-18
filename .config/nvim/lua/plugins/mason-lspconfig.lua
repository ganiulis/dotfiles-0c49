return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "ray-x/lsp_signature.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  },
  opts = {
    ensure_installed = {
      "prettier",
      "stylua",
      "lua-language-server",
      "marksman",
    },
  },
  config = function(_, opts)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_signature = require("lsp_signature")
    local telescope_builtin = require("telescope.builtin")
    local on_attach = function(client, bufnr)
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true) end
      lsp_signature.on_attach({}, bufnr)

      local map = require("utils.map")("lsp")
      map({
        desc = "Rename",
        key = "<leader>rn",
        action = vim.lsp.buf.rename,
      })
      map({
        desc = "Code action",
        key = "<leader>ca",
        action = vim.lsp.buf.code_action,
      })
      map({
        desc = "Go to definition",
        key = "gd",
        action = vim.lsp.buf.definition,
      })
      map({
        desc = "Find references",
        key = "gr",
        action = telescope_builtin.lsp_references,
      })
      map({
        desc = "Go to implementation",
        key = "gi",
        action = telescope_builtin.lsp_implementations,
      })
    end

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath("config")
            and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
            },
          },
        })
      end,
      settings = {
        Lua = {
          telemetry = {
            enable = false,
          },
        },
      },
    })
    vim.lsp.config("marksman", {
      on_attach = on_attach,
      capabilities = capabilities,
    })

    require("mason").setup()
    require("mason-lspconfig").setup()

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      local packages = table.concat(opts.ensure_installed, " ")
      vim.cmd("MasonInstall " .. packages)
    end, {})
  end,
}
