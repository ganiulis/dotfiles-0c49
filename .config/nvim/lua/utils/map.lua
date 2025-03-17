return function(group)
  return function(input)
    local config = {
      desc = "[" .. group .. "] " .. input.desc,
      remap = input.remap,
      noremap = input.noremap,
      silent = input.silent,
    }
    vim.keymap.set(input.mode or "n", input.key, input.action, config)
  end
end
