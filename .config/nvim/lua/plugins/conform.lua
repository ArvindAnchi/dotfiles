return {
	'stevearc/conform.nvim',
	opts = {
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 500,
			lsp_format = 'prefer',
		},
	},
	formatters_by_ft = {
		lua = { 'stylua' },
	},
}
