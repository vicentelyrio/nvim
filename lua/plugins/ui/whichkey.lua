local keys = require('settings.keyboard.keys')

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern',
    delay = 300,
    spec = {
      { '<leader>f', group = 'find / files' },
      { '<leader>q', group = 'quickfix' },
      { '<leader>x', group = 'diagnostics / trouble' },
      { '<leader>g', group = 'git' },
      { '<leader>s', group = 'spectre / search' },
      { '<leader>o', group = 'opencode' },
      { '<leader>n', group = 'next / notify' },
      { '<leader>p', group = 'prev' },
      { '<leader>w', group = 'word / write' },
    },
  },
  keys = {
    {
      keys.whichkey.buffer_local,
      function() require('which-key').show({ global = false }) end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
