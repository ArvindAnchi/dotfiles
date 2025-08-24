return {
    'hanschen/vim-ipython-cell',
    branch = 'master',
    dependencies = { 'jpalardy/vim-slime' },
    ft = { 'python' },
    config = function()
        vim.g.slime_target = 'tmux'
        vim.g.slime_python_ipython = 1
        vim.g.slime_dont_ask_default = 1
        vim.g.slime_default_config = { socket_name = vim.split(vim.env.TMUX, ",")[1], target_pane = "{last}", }

        vim.keymap.set('n', '<leader>r', vim.cmd.IPythonCellExecuteCellVerbose,
            { desc = 'E[x]ecute cell', noremap = true, silent = true })
        vim.keymap.set('x', '<leader>r', '<Plug>SlimeRegionSend',
            { desc = 'Send [H]ighlighted region' })
        vim.keymap.set('n', '<leader>R', vim.cmd.IPythonCellRestart,
            { desc = '[Q]uick restart', noremap = true, silent = true })
    end,
}
