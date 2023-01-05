import({ "Comment", "Comment.utils", "ts_context_commentstring.utils", "ts_context_commentstring.internal" }, function(modules)
    local comment = modules["Comment"]
    local utils = modules["Comment.utils"]
    local ts_utils = modules["ts_context_commentstring.utils"]
    local ts_internal = modules["ts_context_commentstring.internal"]
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
    keymap("x", "gcc", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

    comment.setup({
        pre_hook = function(ctx)
            -- Only calculate commentstring for tsx filetypes
            if vim.bo.filetype == "typescriptreact" then
                -- Determine whether to use linewise or blockwise commentstring
                local type = ctx.ctype == utils.ctype.linewise and "__default" or "__multiline"

                -- Determine the location where to calculate commentstring from
                local location = nil
                if ctx.ctype == utils.ctype.blockwise then
                    location = ts_utils.get_cursor_location()
                elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
                    location = ts_utils.get_visual_start_location()
                end

                return ts_internal.calculate_commentstring({
                    key = type,
                    location = location,
                })
            end
        end,
    })
end)
