return {
    'mbbill/undotree',
    keys = {
        { '<leader>u', function() vim.cmd('UndotreeToggle | UndotreeFocus') end, desc = 'Toggle undotree' },
    }
}
