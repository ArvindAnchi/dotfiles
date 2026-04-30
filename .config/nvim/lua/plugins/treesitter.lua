vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' }, { confirm = false })

require('nvim-treesitter').install({
	'c',
	'lua',
	'markdown',
	'markdown_inline',
	'query',
	'vim',
	'vimdoc',
	'bash',
	'diff',
	'git_rebase',
	'gitcommit',
	'go',
	'json',
	'python',
})

vim.api.nvim_create_autocmd({ 'PackChanged' }, {
	callback = function(ev)
		if ev.data.spec.name == 'nvim-treesitter' and (ev.data.kind == 'install' or ev.data.kind == 'update') then
			vim.schedule(function()
				vim.cmd.TSUpdate()
			end)
		end
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev)
		pcall(vim.treesitter.start)
	end,
})
