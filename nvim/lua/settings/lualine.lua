--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: lualine.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local status_ok, lualine = pcall(require, "lualine")
local icons_ok, icons = pcall(require, "settings.icons")
if not (status_ok or icons_ok) then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = icons.diagnostics.BoldError .. " ", warn = icons.diagnostics.BoldWarning .. " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = {
		added = icons.git.LineAdded .. " ",
		modified = icons.git.LineModified .. " ",
		removed = icons.git.LineRemoved .. " ",
	},
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local location = {
	"location",
	padding = 1,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { diagnostics },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { "progress" },
	},
})
