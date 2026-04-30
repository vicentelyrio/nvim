return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.*',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'jvgrootveld/telescope-zoxide',
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup()

    telescope.load_extension('zoxide')
  end
}
