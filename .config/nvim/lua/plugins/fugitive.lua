return {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
        { '<leader>g', function() vim.cmd('Git | resize 40') end, desc = 'git fugitive' },
    }
}
