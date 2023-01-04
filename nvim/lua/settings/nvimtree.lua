--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: nvimtree.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local tree_ok, nvimtree = pcall(require, "nvim-tree")
local config_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
local icons_ok, icons = pcall(require, "settings.icons")
if not (tree_ok or config_ok or icons_ok) then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local options = {
	filters = {
		dotfiles = false,
        custom = { "node_modules" },
		exclude = {},
	},
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
	auto_reload_on_write = false,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_directories = {
		enable = false,
	},
	open_on_setup = true,
	ignore_ft_on_setup = { "alpha" },
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = icons.diagnostics.BoldHint,
			info = icons.diagnostics.BoldInformation,
			warning = icons.diagnostics.BoldWarning,
			error = icons.diagnostics.BoldError,
		},
	},
	view = {
		side = "left",
		width = 35,
		hide_root_folder = false,
		mappings = {
			list = {
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "h", cb = tree_cb("split") },
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 200,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
            quit_on_open = true,
			resize_window = true,
		},
	},
	renderer = {
		highlight_git = true,
        group_empty = false,
        root_folder_modifier = ":t",
		highlight_opened_files = "none",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
            webdev_colors = true,
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = icons.ui.File,
				symlink = icons.ui.FileSymlink,
				folder = {
					default = icons.ui.Folder,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					open = icons.ui.FolderOpen,
					symlink = icons.ui.FolderSymlink,
					symlink_open = icons.ui.FolderSymlink,
					arrow_open = icons.ui.ChevronShortUp,
					arrow_closed = icons.ui.ChevronShortRight,
				},
				git = {
					unstaged = icons.git.FileUnstaged,
					staged = icons.git.FileStaged,
					unmerged = icons.git.FileUnmerged,
					renamed = icons.git.FileRenamed,
					untracked = icons.git.FileUntracked,
					deleted = icons.git.FileDeleted,
					ignored = icons.git.FileIgnored,
				},
			},
		},
	},
}

nvimtree.setup(options)
