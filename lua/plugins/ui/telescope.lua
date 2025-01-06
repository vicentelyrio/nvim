return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ahmedkhalf/project.nvim',
    'jvgrootveld/telescope-zoxide',
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup()

    telescope.load_extension('projects')
    telescope.load_extension('zoxide')
    telescope.load_extension('noice')
  end
}
