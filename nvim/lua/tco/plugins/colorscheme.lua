return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
 --      require("tco.config.colorscheme").setup()
	-- 	end,
	-- },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  }
}
