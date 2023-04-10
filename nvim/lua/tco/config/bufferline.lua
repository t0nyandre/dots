local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
      -- numbers = function(opts)
      -- 	return string.format("%s.", opts.id)
      -- end,
      -- indicator_icon = "▎",
      -- number_style = "superscript",
      mappings = true,
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 20,
      show_buffer_close_icons = false,
      close_command = "bdelete! %d",
      left_mouse_command = "buffer %d", -- Change to buffer on left click
      right_mouse_command = "vertical sbuffer %d", -- Open a vertical split on right click
      middle_mouse_command = "bdelete! %d", -- Close the buffer on middle click
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "directory",
      offsets = { -- Apply an offset for sidebar windows
        {
          filetype = "neo-tree",
          text = "",
          highlight = "Directory",
          text_align = "center",
        },
      },
      diagnostics = false, -- Set to "nvim_lsp" for enabling LSP diagnostics
      highlights = {
        buffer_selected = {
          bold = true,
        },
      },
    },
  })
end

return M
