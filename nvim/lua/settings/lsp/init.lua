require("settings.lsp.on_attach").setup()

import({ "mason", "mason-lspconfig", "lspconfig" }, function(modules)
    local mason = modules["mason"]
    local masonLspConfig = modules["mason-lspconfig"]
    local lspconfig = modules["lspconfig"]
    local icons = require("settings.icons")

    local lsp_servers = {
        "sumneko_lua",
        "tsserver",
        "gopls",
        "jsonls",
        "cssls",
        "html",
        "lemminx",
        "yamlls",
        "bashls",
    }

    mason.setup({
        ui = {
            border = "rounded",
            icons = {
                package_pending = icons.ui.Dashboard .. " ",
                package_installed = icons.ui.BoxChecked .. " ",
                package_uninstalled = " " .. icons.misc.Skull,
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 5,
        },
    })

    local lsp_opts = {
        on_attach = require("settings.lsp.on_attach").on_attach,
        capabilities = require("settings.lsp.on_attach").capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }

    masonLspConfig.setup({
        ensure_installed = lsp_servers,
    })

    masonLspConfig.setup_handlers({
        function(server_name)
            local has_custom_opts, custom_opts = pcall(require, "settings.lsp.settings." .. server_name)
            local server_opts = lsp_opts

            if has_custom_opts then
                server_opts = vim.tbl_deep_extend("force", custom_opts, lsp_opts)
            end

            lspconfig[server_name].setup(server_opts)
        end,
    })

    require("settings.lsp.null-ls")
    require("settings.lsp.lsp_signature")
end)
