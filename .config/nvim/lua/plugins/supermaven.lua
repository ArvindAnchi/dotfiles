return {
    {
        'supermaven-inc/supermaven-nvim',
        config = function()
            require('supermaven-nvim').setup {}
        end,
        enabled = function()
            local current_dir = vim.fn.getcwd()
            return current_dir:find '^/mnt/home/arvindanchi/.pk2' == nil
        end,
    },
}
