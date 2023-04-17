local M = {}

function M.setup()
  local icons = require("tco.icons")
  local utils = require("tco.utils")

  require("notify").setup {
    background_colour = "#000000",
    render = "default",
    stages = "fade_in_slide_out",
    level = "info",
    minimum_width = 50,
    timeout = 3000,
    fps = 30,
    icons = {
      DEBUG = icons.diagnostics.Debug,
      ERROR = icons.diagnostics.Error,
      INFO = icons.diagnostics.Information,
      TRACE = icons.diagnostics.Trace,
      WARN = icons.diagnostics.Warning,
    },
    on_open = function(win)
      -- Set custom options for the notification windows
      vim.api.nvim_win_set_config(win, {
        focusable = false,
        zindex = 200,
      })
    end,
  }

  --- Set nvim-notify as the default handler for notifications
  vim.notify = require("notify")
  utils.map("n", "<leader>nd", require("notify").dismiss, { desc = "Clear notifications" })
end

return M
