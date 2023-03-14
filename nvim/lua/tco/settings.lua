local opt = vim.opt
local ok, utils = pcall(require, "tco.utils")
if not ok then
	return
end

vim.g.editorconfig = true

-- Kickstarter options
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.undofile = true
-- opt.undodir = utils.join_paths(vim.fn.stdpath "cache", "undodir")
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"
opt.termguicolors = true

-- File encodings
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

-- Backup
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Ui
opt.background = "dark"
opt.lazyredraw = true
opt.scrolloff = 10
opt.cmdheight = 0
opt.wrap = false
opt.cursorline = true
opt.title = true
opt.showtabline = 0
opt.showcmd = false
opt.ruler = false
opt.numberwidth = 2
opt.winbar = "%=%m %-.16t"

if vim.g.neovide then
  vim.opt.guifont = { "JetBrains Nerd Font Mono", "h9" }
  vim.g.neovide_scale_factor = 0.3
end

-- Split
opt.splitbelow = true
opt.splitright = true

opt.showmode = false
opt.laststatus = 3
opt.isfname:append "@-@"

-- Indenting
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Searching
opt.incsearch = true

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.shortmess:append("sI")
opt.whichwrap:append("<>[]hl")
opt.iskeyword:append("-")
