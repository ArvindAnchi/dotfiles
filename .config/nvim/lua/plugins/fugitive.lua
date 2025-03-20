return {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
        { '<leader>g', function() vim.cmd('Git') end, desc = 'git fugitive' },
    }
}
