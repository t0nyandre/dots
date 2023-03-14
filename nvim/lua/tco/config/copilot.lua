local M = {}

function M.setup()
  require("copilot").setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 80,
      keymap = {
        accept = "<M-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    panel = { enabled = false },
  })
end

return M
