vim.pack.add({ 'https://github.com/tpope/vim-fugitive' })

vim.keymap.set('n', '<leader>g', function()
	vim.cmd('Git')
end, { desc = 'git fugitive' })
