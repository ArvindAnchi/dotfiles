vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.hl.hl_op({ higroup = 'Visual', timeout = 300 })
	end,
})

vim.api.nvim_create_autocmd('TextPutPost', {
	callback = function()
		vim.hl.hl_op({ higroup = 'Visual', timeout = 300 })
	end,
})
