vim.pack.add({ 'https://github.com/mbbill/undotree' })

vim.keymap.set('n', '<leader>u', function()
	vim.cmd('UndotreeToggle | UndotreeFocus')
end, { desc = 'Toggle undotree' })
