return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter').install { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' }
  end,
}
