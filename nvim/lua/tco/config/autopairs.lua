local M = {}

function M.setup()
  require("nvim-autopairs").setup({
    check_ts = true,
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
end

return M
