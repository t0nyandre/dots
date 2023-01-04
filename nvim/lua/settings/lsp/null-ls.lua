import({ "mason-null-ls", "null-ls", "mason-null-ls.automatic_setup" }, function(modules)
    local mason_null_ls = modules["mason-null-ls"]
    local mason_auto_setup = modules["mason-null-ls.automatic_setup"]
    local null_ls = modules["null-ls"]

    local formatServers = {
        "stylua",
        "prettierd",
        "goimports",
        "gofumpt",
    }

    mason_null_ls.setup {
        ensure_installed = formatServers
    }

    mason_null_ls.setup_handlers({
        function(source_name, methods)
            mason_auto_setup(source_name, methods)
        end,
    })
    
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- local diagnostics = null_ls.builtins.diagnostics
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
        debug = false,
        sources = {
            formatting.prettier.with({
                extra_filetypes = { "toml" },
            }),
            formatting.stylua.with({
                command = { "stylua" },
                filetypes = { "lua", "luau" },
                extra_args = {
                    "collapse_simple_statement",
                    "Always",
                    "call_parantheses",
                    "None",
                },
            }),
            code_actions.gitsigns,
            formatting.goimports.with({
                filetypes = { "go" },
            }),
            formatting.gofumpt.with({
                filetypes = { "go" },
            }),
        },
    })
end)
