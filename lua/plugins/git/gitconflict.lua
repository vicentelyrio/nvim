return {
  'akinsho/git-conflict.nvim',
  event = "VeryLazy",
  version = '*',
  config = function()
    require('git-conflict').setup()

    local keys = require('settings.keyboard.keys')
    vim.keymap.set('n', keys.git.conflicts, '<cmd>GitConflictListQf<CR>',
      { noremap = true, silent = true, desc = 'List git conflicts (quickfix)' })
  end
}

