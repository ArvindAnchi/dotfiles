return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({})

        pcall(require('telescope').load_extension, 'fzf')

        local builtin = require 'telescope.builtin'

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader><leader>', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })
    end,
}
