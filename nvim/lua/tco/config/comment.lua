local M = {}

function M.setup()
  require("Comment").setup({
    padding = true,
    pre_hook = function(ctx)
      local utils = require("Comment.utils")
      local ts_utils = require("ts_context_commentstring.utils")
      local ts_internal = require("ts_context_commentstring.internal")

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

  local utils = require("tco.utils")
  utils.map("n", "gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
  utils.map("x", "gcc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
end

return M
