vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
vim.pack.add({ 'https://github.com/echasnovski/mini.icons' })

local oil = require('oil')

oil.setup({
	columns = {
		'icon',
		'mtime',
		'size',
	},
	keymaps = {
		['<C-c>'] = 'actions.refresh',
		['<C-p>'] = require('telescope.builtin').git_files,
	},
	view_options = {
		show_hidden = true,
	},
})
