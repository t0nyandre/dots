local M = {}

local utils = require("tco.utils")
local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
    utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    utils.map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    utils.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    utils.map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
    utils.map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")
    utils.map("n", "<leader>li", "<cmd>LspInfo<cr>")
    utils.map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>")
    utils.map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    utils.map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
    utils.map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")
    utils.map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
    utils.map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    utils.map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
end)

lsp.preset("recommended")

lsp.ensure_installed({
    "bashls",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "marksman",
    "sqlls",
    "taplo",
    "lemminx",
    "yamlls",
})

M.lsp = lsp

return M
