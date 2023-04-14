local neodev_ok, neodev = pcall(require, "neodev")
local cmp_nvim_lsp_ok, _ = pcall(require, "cmp_nvim_lsp")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_ok, mason = pcall(require, "mason")
local lsp_format_ok, lsp_format = pcall(require, "lsp-format")
local utils = require("tco.utils")

if not (neodev_ok and cmp_nvim_lsp_ok and mason_lspconfig_ok and mason_ok and lsp_format_ok) then
  vim.api.nvim_err_writeln("Failed to load neodev, cmp_nvim_lsp, mason-lspconfig, lsp-format or mason")
  return
end

neodev.setup()
mason.setup({
  ui = {
    border = "rounded",
  }
})

local on_attach = function(client, _)
  if (utils.has_value({ "gopls", "tsserver", "lua_ls" }, client.name)) then
    lsp_format.on_attach(client)
  end

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
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "gopls",
  "tsserver",
  "lua_ls",
}

require("tco.config.lsp.cmp")

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, server_name in ipairs(servers) do
  local server_config_ok, mod = pcall(require, "tco.config.lsp.servers." .. server_name)
  if not server_config_ok then
    require("notify")("There is no config file for LSP " .. server_name, "warn")
  else
    mod.setup(on_attach, capabilities)
  end
end

require("tco.config.lsp.null-ls").setup()
