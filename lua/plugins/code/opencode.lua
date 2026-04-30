local keys = require('settings.keyboard.keys')

return {
  'nickjvandyke/opencode.nvim',
  version = '*',
  keys = {
    { keys.opencode.ask,           mode = { 'n', 'x' }, desc = 'Ask opencode' },
    { keys.opencode.select_action, mode = { 'n', 'x' }, desc = 'Opencode action' },
    { keys.opencode.toggle,        mode = { 'n', 't' }, desc = 'Toggle opencode' },
    { keys.opencode.add_range,     mode = { 'n', 'x' }, desc = 'Add range to opencode' },
    { keys.opencode.add_line,      mode = 'n',          desc = 'Add line to opencode' },
    { keys.opencode.scroll_up,     mode = 'n',          desc = 'Scroll opencode up' },
    { keys.opencode.scroll_down,   mode = 'n',          desc = 'Scroll opencode down' },
  },
  dependencies = {
    {
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
        terminal = {},
      },
    },
  },
  config = function()
    local opencode = require('opencode')

    ---@type opencode.Opts
    vim.g.opencode_opts = {}

    vim.keymap.set({ 'n', 'x' }, keys.opencode.ask,           function() opencode.ask('@this: ', { submit = true }) end, { desc = 'Ask opencode' })
    vim.keymap.set({ 'n', 'x' }, keys.opencode.select_action, function() opencode.select() end,                          { desc = 'Opencode action' })
    vim.keymap.set({ 'n', 't' }, keys.opencode.toggle,        function() opencode.toggle() end,                          { desc = 'Toggle opencode' })
    vim.keymap.set({ 'n', 'x' }, keys.opencode.add_range,     function() return opencode.operator('@this ') end,         { desc = 'Add range to opencode', expr = true })
    vim.keymap.set('n',          keys.opencode.add_line,      function() return opencode.operator('@this ') .. '_' end,  { desc = 'Add line to opencode', expr = true })
    vim.keymap.set('n',          keys.opencode.scroll_up,     function() opencode.command('session.half.page.up') end,   { desc = 'Scroll opencode up' })
    vim.keymap.set('n',          keys.opencode.scroll_down,   function() opencode.command('session.half.page.down') end, { desc = 'Scroll opencode down' })
  end,
}
