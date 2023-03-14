local M = {}

function M.setup()
	local icons = require("tco.icons")
    local ok, wk = pcall(require, "which-key")
    if not ok then
        return
    end

	wk.setup({
		active = true,
		on_config_done = nil,
		setup = {
			plugins = {
				marks = false,
				registers = false,
				spelling = {
					enabled = false,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
		},
		icons = {
			breadcrumb = icons.ui.ChevronShortRight,
			separator = icons.ui.Ellipsis,
			group = "",
		},
		popup_mappings = {
			["<tab>"] = "cycle",
			["<s-tab>"] = "cycle_back",
			["<cr>"] = "execute",
			["<c-p>"] = "preview",
			["<esc>"] = "close",
		},
		window = {
			border = "single",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 2, 2, 2, 2 },
			winblend = 0,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		ignore_missing = false,
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
        show_help = true,
        show_keys = true,
        triggers = "auto",
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
            n = {},
        },
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
	})

    wk.register({
        ["<leader>"] = {
            f = {
                name = "File",
            }
        }
    })
end

return M
