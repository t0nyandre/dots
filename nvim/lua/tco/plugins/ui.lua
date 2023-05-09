return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        config = function()
          require("tco.config.windowpicker").setup()
        end,
      },
    },
    config = function()
      require("tco.config.neotree").setup()
    end,
  },
  "nvim-tree/nvim-web-devicons", -- fast lau file drawer
  {
    "rcarriga/nvim-notify",
    config = function()
      require("tco.config.notify").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("tco.config.indent-blankline").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("tco.config.indentscope").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("tco.config.illuminate").setup()
    end,
  },
  -- dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("tco.config.alpha").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "ahmedkhalf/project.nvim",
      "nvim-telescope/telescope-symbols.nvim",
    },
    config = function()
      require("tco.config.telescope").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("tco.config.gitsigns").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    config = function()
      require("tco.config.which-key").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("tco.config.bufferline").setup()
    end,
  },
}
