return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  lazy = false,
  config = function ()
    require('spectre').setup()
  end
}


