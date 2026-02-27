vim.pack.add({ 'https://github.com/nvim-lua/plenary.nvim.git' })
vim.pack.add({ 'https://github.com/nvim-telescope/telescope-fzf-native.nvim.git' }, {
	build = 'make',
	cond = function()
		return vim.fn.executable('make') == 1
	end,
})
vim.pack.add({ 'https://github.com/nvim-telescope/telescope.nvim.git' })

require('telescope').setup({
	defaults = {
		-- Ignoring virtual csharp files for rzls.nvim
		file_ignore_patterns = { '__virtual%.cs$' },
	},
})

pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
