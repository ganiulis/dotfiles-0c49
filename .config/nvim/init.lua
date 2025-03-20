local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.relativenumber = true
-- Resets cursor on exit.
-- See https://github.com/neovim/neovim/issues/4396#issuecomment-1377191592.
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.guicursor = ""
    vim.fn.chansend(vim.v.stderr, "\x1b[ q")
  end,
})

require("lazy").setup({
  spec = { { import = "plugins" } },
  checker = { enabled = true },
})

local map = require("utils.map")("Custom")
map({
  key = ";",
  action = ":",
  desc = "Enter command mode",
})
map({
  key = "<C-_>",
  action = "gcc<bar>j",
  desc = "Toggle comment",
  remap = true,
})
map({
  mode = "v",
  key = "<C-_>",
  action = "gc",
  desc = "Toggle comment",
  remap = true,
})
