local vo = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vo.autoindent = true
vo.breakindent = true
vo.clipboard = "unnamedplus"
vo.cmdheight = 0
vo.completeopt = "menuone,noselect"
vo.conceallevel = 0
vo.cursorline = true
vo.foldcolumn = "1"
vo.foldenable = true
vo.foldlevel = 99
vo.foldlevelstart = 99
vo.formatoptions = "jqlnt" -- default: tcqj
vo.hidden = true
vo.hlsearch = false
vo.ignorecase = true
vo.inccommand = "nosplit"
vo.joinspaces = false
vo.laststatus = 0
vo.fillchars = { eob = " " }
vo.list = true
vo.mouse = "a"
vo.number = true
vo.relativenumber = true
vo.scrollback = 100000
vo.scrolloff = 5
vo.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vo.shiftround = true
vo.shiftwidth = 2
vo.shortmess:append({ W = true, I = true, c = true, C = true })
vo.showcmd = false
vo.showmode = false
vo.sidescrolloff = 5
vo.signcolumn = "yes"
vo.smartcase = true
vo.smartindent = true
vo.splitbelow = true
vo.splitkeep = "screen"
vo.splitright = true
vo.tabstop = 2
vo.termguicolors = true
vo.timeoutlen = 300
vo.title = true
vo.undofile = true
vo.updatetime = 200
vo.wildmode = "longest:full,full"
vo.expandtab = true

vim.g.markdown_recommended_style = 0

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
