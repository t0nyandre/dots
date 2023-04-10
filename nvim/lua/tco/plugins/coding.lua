return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("tco.config.copilot").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>so", "<cmd>SymbolsOutline<cr>", desc = "[S]ymbols [O]utline" } },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("tco.config.autopairs").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("tco.config.surround").setup()
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("tco.config.go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}
