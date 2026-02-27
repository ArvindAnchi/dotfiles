vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

local conform = require('conform')
local mason_bin = vim.fn.expand('$MASON/bin')

conform.setup({
	opts = {
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 500,
			lsp_format = 'prefer',
		},
	},
	formatters_by_ft = {
		lua = { 'stylua' },
		cs = { 'csharpier' },
		go = { 'goimports', 'gofumpt' },
	},
	formatters = {
		csharpier = {
			command = mason_bin .. '/' .. 'csharpier',
			args = { 'format', '--write-stdout' },
			to_stdin = true,
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})
