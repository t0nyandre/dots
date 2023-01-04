--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: init.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local tree_status_ok, _ = pcall(require, "nvim-treesitter")
local config_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not (tree_status_ok or config_status_ok) then
	return
end

configs.setup({
	ensure_installed = {
		"lua",
		"make",
		"go",
        "gomod",
		"markdown",
		"markdown_inline",
		"bash",
	},
	highlight = {
		enable = true,
		disable = {
			"css",
		},
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {
			"css",
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = true,
	},
})
