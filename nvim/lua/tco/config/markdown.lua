local M = {}

function M.setup()
  local utils = require("tco.utils")
  utils.map("n", "<C-s>", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })

  vim.g.mkdp_auto_start = 1
  vim.g.mkdp_echo_preview_url = 1
  vim.g.mkdp_filetypes = { "markdown" }
end

return M
