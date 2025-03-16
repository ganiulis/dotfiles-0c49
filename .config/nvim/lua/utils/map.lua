return function(key, func, desc)
  if desc then desc = "(Custom) " .. desc end
  vim.keymap.set("n", key, func, { noremap = true, silent = true, desc = desc })
end

