require("lazypath")
require("config")
require("lazy").setup({
  spec = {
    {
      import = "plugins",
    },
  },
  checker = {
    enabled = true,
  },
  rocks = {
    enabled = false,
  },
})
require("mappings")
