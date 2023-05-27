local M = {}

function M.setup()
  local ok, telescope = pcall(require, "telescope")
  local project_ok, project = pcall(require, "project_nvim")
  local icons_ok, icons = pcall(require, "tco.icons")
  local utils = require("tco.utils")
  if not (ok and project_ok and icons_ok) then return end

  utils.map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
  utils.map("n", "<leader>ft", ":Telescope live_grep<CR>", { desc = "Find text" })
  utils.map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Find recent files" })
  utils.map("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects{}<CR>",
    { desc = "Find projects" })
  utils.map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
  utils.map("n", "<leader>fs", "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>",
    { desc = "Find emoji" })

  project.setup({
    detection_methods = { "pattern" },
    patterns = {
      ".editorconfig",
      "go.mod",
      "go.sum",
      "stylua.toml",
      "Makefile",
      ".git",
    },
  })

  telescope.setup({
    defaults = {
      prompt_prefix = icons.ui.Search .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_defaults = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      file_ignore_patterns = {
        "node_modules",
        "target",
        "dist",
        "build",
        "vendor",
        "bin",
        "obj",
        "out",
        "tmp",
        "cache",
        "deps",
        "li",
      },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
        },
        n = {
          ["<esc>"] = require("telescope.actions").close,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      },
    },
  })

  require("telescope").load_extension("fzf")
  require("telescope").load_extension("projects")
end

return M
