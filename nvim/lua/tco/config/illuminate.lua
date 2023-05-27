local M = {}

function M.setup()
  require("illuminate").configure({
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 120,
    filetypes_denylist = {
      "dirvish",
      "fugitive",
      "alpha",
      "NvimTree",
      "neo-tree",
      "packer",
      "neogitstatus",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
    },
    filetypes_allowlist = {},
    modes_denylist = {},
    modes_allowlist = {},
    providers_regex_syntax_denylist = {},
    providers_regex_syntax_allowlist = {},
    under_cursor = true,
  })

  vim.g.Illuminate_delay = 100
  vim.g.Illuminate_ftblacklist = { "NvimTree", "neo-tree", "alpha" }
end

return M
