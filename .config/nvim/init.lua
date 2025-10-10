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

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.opt.guicursor = ""
    vim.fn.chansend(vim.v.stderr, "\x1b[ q")
  end,
})

if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "clip.exe (Copy Only)",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    cache_enabled = true,
  }
end

vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
vim.opt.relativenumber = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", ";", ":")
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc<bar>j", { remap = true })

require("lazy").setup({
  spec = {
    {
      import = "plugins",
    },
  },
  rocks = {
    enabled = false,
  },
  checker = {
    enabled = true,
  },
})
