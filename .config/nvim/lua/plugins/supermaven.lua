vim.pack.add({ 'https://github.com/supermaven-inc/supermaven-nvim' })

local current_dir = vim.fn.getcwd()
if current_dir:find('.pk2') == nil then
	local supermaven = require('supermaven-nvim')
	supermaven.setup({})
end
