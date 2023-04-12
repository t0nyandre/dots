return {
	{ "folke/neodev.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
	 "williamboman/mason-lspconfig.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim", },
			{
				"ray-x/lsp_signature.nvim",
				event = "BufReadPre",
				config = function()
					require("tco.config.lsp.signature").setup()
				end,
			},
      { "lukas-reineke/lsp-format.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("tco.config.lsp")
		end,
	},
}
