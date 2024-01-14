return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            local compare = require "cmp.config.compare"
            local source_names = {
                nvim_lsp = "(LSP)",
                luasnip = "(Snippet)",
                buffer = "(Buffer)",
                path = "(Path)",
            }
            local duplicates = {
                buffer = 1,
                path = 1,
                nvim_lsp = 0,
                luasnip = 1,
            }
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
            end

            cmp.setup {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        compare.score,
                        compare.recently_used,
                        compare.offset,
                        compare.exact,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping {
                        i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
                        c = function(fallback)
                            if cmp.visible() then
                                cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
                            else
                                fallback()
                            end
                        end,
                    },
                    ["<C-j>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                        "c",
                    }),
                    ["<C-k>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                        "c",
                    }),
                },
                sources = cmp.config.sources {
                    { name = "nvim_lsp", group_index = 1 },
                    { name = "luasnip",  group_index = 1 },
                    { name = "buffer",   group_index = 2 },
                    { name = "path",     group_index = 2 },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        local duplicates_default = 0
                        item.menu = source_names[entry.source.name]
                        item.dup = duplicates[entry.source.name] or duplicates_default
                        return item
                    end,
                },
            }
        end
    }
}
