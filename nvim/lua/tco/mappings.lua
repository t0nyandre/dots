local ok, utils = pcall(require, "tco.utils")
if not ok then
    return
end

vim.g.mapleader = ","
vim.g.maplocalleader = ","

utils.map({ "n", "v" }, "<Space>", "<Nop>")

-- better up/down
utils.map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
utils.map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
utils.map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
utils.map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
utils.map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
utils.map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
utils.map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
utils.map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
utils.map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
utils.map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
utils.map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
utils.map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
utils.map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
utils.map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
utils.map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
utils.map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
utils.map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
utils.map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
utils.map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
utils.map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
utils.map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
utils.map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

utils.map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
utils.map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
utils.map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
utils.map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
utils.map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
utils.map("v", "<", "<gv")
utils.map("v", ">", ">gv")

-- lazy
utils.map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- Quit from insert mode
utils.map("i", "jk", "<ESC>")
utils.map("i", "<C-C>", "<ESC>")

-- windows
utils.map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
utils.map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
utils.map("n", "<leader>hs", "<C-W>s", { desc = "Split window below" })
utils.map("n", "<leader>vs", "<C-W>v", { desc = "Split window right" })
