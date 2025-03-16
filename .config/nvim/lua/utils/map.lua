return function(group)
  return function(input)
    local config = {
      noremap = true,
      silent = true,
      desc = "(" .. group .. ") " .. input.desc,
    }
    vim.keymap.set(input.mode or "n", input.key, input.func, config)
  end
end
