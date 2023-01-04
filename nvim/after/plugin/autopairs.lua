import({ "nvim-autopairs", "cmp", "nvim-autopairs.completion.cmp" }, function(modules)
    local autopairs = modules["nvim-autopairs"]
    local cmp = modules["cmp"]
    local cmp_autopairs = modules["nvim-autopairs.completion.cmp"]

    autopairs.setup({
        check_ts = true, -- treesitter integration
        disable_filetype = { "TelescopePrompt", "vim" },
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
        },

        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
end)
