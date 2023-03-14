return {
    {
        "numToStr/Comment.nvim",
        dependencies = {
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        },
        config = function()
            require("tco.config.comment").setup()
        end
    }
}
