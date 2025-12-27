return {
  'mistweaverco/kulala.nvim',
  opts = {
    ui = {
      display_mode = 'split',
      split_direction = 'vertical',
      win_opts = {
        width = 100,
        wo = {  number = true, wrap = true, foldmethod = "manual" }, -- window options
      },
      default_view = 'headers_body',
      winbar = true,
      default_winbar_panes = { 'body', 'headers_body', 'verbose' },
      show_icons = 'signcolumn',
      icons = {
        inlay = {
          loading = '⏳',
          done = '✅',
          error = '❌',
        },
        lualine = '🐼',
        textHighlight = 'WarningMsg', -- highlight group for request elapsed time
      },

      report = {
        show_script_output = 'on_error',
        show_asserts_output = 'failed_only',
        show_summary = 'on_error',

        headersHighlight = 'Special',
        successHighlight = 'String',
        errorHighlight = 'Error',
      },
    },

    lsp = {
      enable = true,

      formatter = {
        sort = {
          metadata = true,
          variables = true,
          commands = false,
          json = false,
        },
      },

      on_attach = nil, -- function called when Kulala LSP attaches to the buffer
    },

    global_keymaps = {
      ['Send request'] = { '<leader>rs', function() require('kulala').run() end, mode = { 'n', 'v' }, desc = 'Send request', },
      ['Send all requests'] = { '<leader>ra', function() require('kulala').run_all() end, mode = { 'n', 'v' }, ft = 'http', },
      ['Replay the last request'] = { '<leader>rr', function() require('kulala').replay() end, ft = { 'http', 'rest' }, },
      ['Find request'] = false,
    },
    global_keymaps_prefix = '<leader>R',
  },
}
