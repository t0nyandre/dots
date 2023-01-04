import("tokyonight", function(tokyonight)
    tokyonight.setup({
        style = "night",
        terminal_colors = true,
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "dark", -- style for sidebars, see below
            floats = "dark", -- style for floating windows
        },
        sidebars = { "qf", "help" },
    })

    vim.cmd("colorscheme tokyonight")
end)
