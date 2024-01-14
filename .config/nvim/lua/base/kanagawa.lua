return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    enabled = true,
    lazy = false,
    config = function()
      local kanagawa = require("kanagawa")
      kanagawa.setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                -- bg = "none"
              }
            }
          }
        },
        transparent = true,
        theme = "dragon",
      })
      vim.cmd("colorscheme kanagawa")
    end
  }
}
