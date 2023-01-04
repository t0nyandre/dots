--
--    /$$      /$$$$$$                                                /$$
--   | $$     /$$$_  $$                                              | $$
--  /$$$$$$  | $$$$\ $$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$
-- |_  $$_/  | $$ $$ $$| $$__  $$| $$  | $$ |____  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
--   | $$    | $$\ $$$$| $$  \ $$| $$  | $$  /$$$$$$$| $$  \ $$| $$  | $$| $$  \__/| $$$$$$$$
--   | $$ /$$| $$ \ $$$| $$  | $$| $$  | $$ /$$__  $$| $$  | $$| $$  | $$| $$      | $$_____/
--   |  $$$$/|  $$$$$$/| $$  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$| $$      |  $$$$$$$
--    \___/   \______/ |__/  |__/ \____  $$ \_______/|__/  |__/ \_______/|__/       \_______/
--                                /$$  | $$   file: ftplugin/go.lua
--                               |  $$$$$$/   url: github.com/t0nyandre
--                                \______/
--
local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }
keymap("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", opts)
keymap("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", opts)
keymap("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", opts)
keymap("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", opts)
keymap("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", opts)
keymap("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", opts)
keymap("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", opts)
keymap("n", "<leader>Cc", "<cmd>GoCmt<Cr>", opts)
keymap("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", opts)
