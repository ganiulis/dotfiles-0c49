local map = require("utils.map")("custom")
map({
  desc = "Enter command mode",
  key = ";",
  action = ":",
})
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
vim.keymap.set("n", "<C-_>", "gcc<bar>j", { remap = true })
