return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    -- stylua: ignore
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>flg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = function(...)
                        require("telescope.actions").move_selection_next(...)
                    end,
                    ["<C-k>"] = function(...)
                        require("telescope.actions").move_selection_previous(...)
                    end,
                    ["<C-n>"] = function(...)
                        require("telescope.actions").cycle_history_next(...)
                    end,
                    ["<C-p>"] = function(...)
                        require("telescope.actions").cycle_history_prev(...)
                    end,
                },
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}
