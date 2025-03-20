local map = require("utils.map")("custom")
map({
  desc = "Enter command mode",
  key = ";",
  action = ":",
})
map({
  desc = "Toggle comment",
  key = "<C-_>",
  action = "gcc<bar>j",
  remap = true,
})
map({
  desc = "Toggle comment",
  mode = "n",
  key = "<C-_>",
  action = "gc",
  remap = true,
})
