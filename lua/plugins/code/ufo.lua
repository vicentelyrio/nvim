return {
  'kevinhwang91/nvim-ufo',
  lazy = false,
  dependencies = {
    'kevinhwang91/promise-async',
  },
  config = function()
    local ufo = require('ufo')

    ufo.setup({
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end
    })
  end
}

