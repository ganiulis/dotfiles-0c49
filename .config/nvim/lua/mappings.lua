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
