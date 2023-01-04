--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: keymaps.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Split window
keymap("n", "<leader>vs", ":vsplit<CR>", opts)
keymap("n", "<leader>hs", ":split<CR>", opts)

-- Move current line / block up or down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) -- clear highlights
keymap("n", "<leader>w", "<cmd>Bdelete!<CR>", opts) -- close buffer
keymap("v", "p", '"_dP', opts) -- better paste
keymap("i", "jk", "<ESC>", opts) -- Ctrl+c to <ESC>

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Comments
keymap("n", "gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "gcc", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects{}<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Gitsigns
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Illuminate
keymap("n", "<A-n>", "<cmd>lua require('illuminate').next_reference{wrap=true}<CR>", opts)
keymap("n", "<A-p>", "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<CR>", opts)

-- DAP
keymap("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", opts)
keymap("n", "<leader>dg", "<cmd>lua require'dap'.session()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dq", "<cmd>lua require'dap'.close()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", opts)
keymap("n", "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", opts)
