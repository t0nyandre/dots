local M = {}

function M.setup()
  require("Comment").setup({
    padding = true,
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })

  local utils = require("tco.utils")
  utils.map("n", "gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
  utils.map("x", "gcc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
end

return M
