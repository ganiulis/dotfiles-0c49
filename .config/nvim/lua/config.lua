vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.relativenumber = true
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
