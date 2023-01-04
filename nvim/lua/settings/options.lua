--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: options.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local opt = vim.opt
-- file encoding
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

-- backups
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath "cache" .. "/undodir"

-- ui
opt.background = "dark"
opt.termguicolors = true
opt.timeoutlen = 300
opt.updatetime = 100
opt.lazyredraw = true
opt.scrolloff = 10
opt.cmdheight = 1
opt.wrap = false
opt.cursorline = true
opt.mouse = "a"
opt.title = true
opt.showtabline = 0
opt.showcmd = false
opt.ruler = false
opt.numberwidth = 2

opt.splitbelow = true
opt.splitright = true

opt.number = true
opt.relativenumber = true
opt.laststatus = 3
opt.signcolumn = "yes"

opt.showmode = false
opt.isfname:append "@-@"

-- indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- clipboard
opt.clipboard:append { "unnamedplus" }
opt.completeopt = "menu,menuone,noselect"

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "manual"

opt.fillchars = { eob = " " }
opt.shortmess:append("sI")
opt.whichwrap:append("<>[]hl")
opt.iskeyword:append("-")

-- leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- disable unneeded builtin plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "netrw",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "machparen",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
