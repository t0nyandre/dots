return {
	"NeogitOrg/neogit",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	cmd = { "Neogit" },
	config = function()
		require("neogit").setup()
		vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { noremap = true, silent = true })
	end,
}
