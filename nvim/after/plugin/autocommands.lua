vim.api.nvim_create_augroup("bufcheck", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

-- highlight yanks
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = "bufcheck",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})
