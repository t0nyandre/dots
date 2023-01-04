local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local icons_ok, icons = pcall(require, "settings.icons")
if not (status_ok or icons_ok) then
	return
end

M.setup = function()
    local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.BoldHint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
	local config = {
		virtual_text = true,
        signs = {
            active = signs,
        },
		update_in_insert = true,
		underline = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local servers = {
    "sumneko_lua",
    "tsserver",
    "gopls",
}

local disable_formatting = function(client)
  client.server_capabilities.document_formatting = false
end

local lookup_value = function(client, table)
  for _, val in pairs(table) do
    if client == val then
      return true
    end
  end

  return false
end

M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    local augroup = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("CursorHold", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float { focusable = false, border = "rounded" }
    end,
    })

    if client.name == "sumneko_lua" then
    -- Since Treesitter and this don't play well together, disable
    -- semanticTokensProvider
    -- TODO: Find a way to make this work later
    -- https://github.com/neovim/neovim/pull/21100
    client.server_capabilities.semanticTokensProvider = nil
    end

    if lookup_value(client.name, servers) then
    disable_formatting(client)
    end


    keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
    keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
    keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
    keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
