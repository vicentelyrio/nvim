local keys = require('settings.keyboard.keys')

return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.*',
  cmd = 'Telescope',
  keys = {
    keys.search.find_files,
    keys.search.find_word,
    keys.search.find_history,
    keys.search.find_buffers,
    keys.ui.colorscheme,
    keys.buffers.list,
    keys.buffers.history,
    keys.git.status,
  },
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
