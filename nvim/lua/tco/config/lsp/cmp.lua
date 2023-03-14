local M = {}

function M.setup()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lsp = require("tco.config.lsp.zero").lsp
	require("luasnip/loaders/from_vscode").lazy_load()

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	local cmp_mappings = lsp.defaults.cmp_mappings({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	})

	lsp.setup_nvim_cmp({
		mapping = cmp_mappings,
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		sources = {
			{ name = "nvim_lsp", keyword_length = 3 },
			{ name = "nvim_lua" },
			{ name = "luasnip", keyword_length = 2 },
			{ name = "treesitter" },
			{ name = "path" },
			{ name = "buffer", keyword_length = 3 },
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = require("tco.icons").kind[vim_item.kind]
				vim_item.menu = ({
					nvim_lsp = "",
					nvim_lua = "",
					luasnip = "",
					treesitter = "",
					buffer = "",
					path = "",
				})[entry.source.name]
				return vim_item
			end,
			duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1,
				treesitter = 1,
			},
			duplicates_default = 0,
		},
	})

	-- Overrides for specific filetypes
	cmp.setup.filetype({ "markdown", "txt" }, {
		sources = {
			{
				name = "look",
				keyword_length = 2,
				option = {
					convert_case = true,
					loud = true,
				},
			},
			{ name = "emoji", insert = true },
		},
	})
end

return M
