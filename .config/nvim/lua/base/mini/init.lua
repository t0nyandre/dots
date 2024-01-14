return {
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    opts = {
      symbol = "▏",
      -- symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "NvimTree",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end
  },
  {
    "echasnovski/mini.cursorword",
    event = "VeryLazy",
    opts = {}
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      local ai = require("mini.ai")
      ai.setup {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        }
      }
    end
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {}
  },
  {
    "echasnovski/mini.move",
    event = "VeryLazy",
    opts = {}
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {}
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {}
  },
  {
    "echasnovski/mini.starter",
    lazy = false,
    dependencies = {
      "echasnovski/mini.sessions",
    },
    config = function()
      require("base.mini.starter")
    end
  }
}
