import({ "nvim-treesitter", "nvim-treesitter.configs" }, function(modules)
    local configs = modules["nvim-treesitter.configs"]

    configs.setup({
        ensure_installed = {
            "lua",
            "make",
            "go",
            "gomod",
            "markdown",
            "markdown_inline",
            "bash",
        },
        highlight = {
            enable = true,
            disable = {
                "css",
            },
        },
        autopairs = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = {
                "css",
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = true,
        },
    })
end)
