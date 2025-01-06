-- folding enhancer
-- see https://github.com/kevinhwang91/nvim-ufo
return {
  'kevinhwang91/nvim-ufo',
  event = "VeryLazy",
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

