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
