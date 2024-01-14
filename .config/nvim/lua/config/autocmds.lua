local function augroup(name)
  return vim.api.nvim_create_augroup("tco_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup "highlight_yank",
  pattern = "*",
})


  -- windows to close
  vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "checkhealth",
    "floggraph",
    "git",
    "help",
    "lspinfo",
    "man",
    "qf",
    "query",
    "startuptime",
    "toggleterm",
    "vim",
    "notify",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
