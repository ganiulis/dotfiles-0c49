return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "ray-x/lsp_signature.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    local lsp_signature = require("lsp_signature")
    local telescope_builtin = require("telescope.builtin")
    local on_attach = function(client, bufnr)
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true) end
      lsp_signature.on_attach({}, bufnr)
      local map = require("utils.map")("lsp")
      map({
        key = "<leader>rn",
        action = vim.lsp.buf.rename,
        desc = "Rename",
      })
      map({
        key = "<leader>ca",
        action = vim.lsp.buf.code_action,
        desc = "Code action",
      })
      map({
        key = "gd",
        action = vim.lsp.buf.definition,
        desc = "Go to definition",
      })
      map({
        key = "gr",
        action = telescope_builtin.lsp_references,
        desc = "Find references",
      })
      map({
        key = "gi",
        action = telescope_builtin.lsp_implementations,
        desc = "Go to implementation",
      })
    end

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
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
      end,
    })
  end,
}
