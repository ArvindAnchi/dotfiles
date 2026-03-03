vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.pack.add({ 'https://github.com/williamboman/mason.nvim' })
vim.pack.add({ 'https://github.com/williamboman/mason-lspconfig.nvim' })
vim.pack.add({ 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' })
vim.pack.add({ 'https://github.com/j-hui/fidget.nvim' })

require('mason').setup({
	registries = {
		'github:mason-org/mason-registry',
		'github:crashdummyy/mason-registry',
	},
})

---@diagnostic disable [missing-fields]
require('mason-lspconfig').setup({})

require('mason-tool-installer').setup({
	ensure_installed = {
		'lua_ls',
		'stylua',
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

		map('K', vim.lsp.buf.hover, 'Hover Documentation')
	end,
})
