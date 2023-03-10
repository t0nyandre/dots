return {
	{ "folke/neodev.nvim" },
	{ "jayp0521/mason-null-ls.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"ray-x/lsp_signature.nvim",
				event = "BufReadPre",
				config = function()
					require("tco.config.lsp.signature").setup()
				end,
			},

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
			require("tco.config.lsp").setup()
		end,
	},
}
