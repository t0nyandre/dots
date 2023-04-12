local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "css",
      "diff",
      "comment",
      "gitignore",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "go",
      "dockerfile",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    highlight = { enable = true, use_languagetree = true },
    context_commentstring = { enable = true },
    indent = { enable = true },
    rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- automatically jump forward to matching textobj
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = false,
        swap_next = { ["<leader>a"] = "@parameter.inner" },
        swap_previous = { ["<leader>A"] = "@parameter.inner" },
      },
    },
  })
end

return M
