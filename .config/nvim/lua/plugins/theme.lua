return {
	'catppuccin/nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme 'catppuccin-mocha'
		vim.cmd.hi 'Comment gui=none'
	end,
}
