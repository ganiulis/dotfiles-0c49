---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/busted/library",
          "${3rd}/luv/library",
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}
