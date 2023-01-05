import("illuminate", function(illuminate)
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }

    keymap("n", "<A-n>", "<cmd>lua require('illuminate').next_reference{wrap=true}<CR>", opts)
    keymap("n", "<A-p>", "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<CR>", opts)

    illuminate.configure({
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        delay = 120,
        filetypes_denylist = {
            "dirvish",
            "fugitive",
            "alpha",
            "NvimTree",
            "packer",
            "neogitstatus",
            "Trouble",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
            "DressingSelect",
            "TelescopePrompt",
        },
        filetypes_allowlist = {},
        modes_denylist = {},
        modes_allowlist = {},
        providers_regex_syntax_denylist = {},
        providers_regex_syntax_allowlist = {},
        under_cursor = true,
    })
end)
