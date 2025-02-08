return {
	'tpope/vim-fugitive',
	lazy = false,
	keys = {
		{ '<leader>g', function() vim.cmd('vert Git') end, desc = 'git fugitive' },
	}
}
