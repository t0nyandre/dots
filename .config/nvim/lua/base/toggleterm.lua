function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

return {
    "akinsho/toggleterm.nvim",
    event = { "BufEnter" },
    opts = {
        size = 15,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        hide_numbers = true,
        shading_factor = "1",
        start_in_insert = true,
        presist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end
}
