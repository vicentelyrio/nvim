return {
  'lukas-reineke/indent-blankline.nvim',
  lazy = false,
  config = function()
    local blankline = require('ibl')
    local highlight = {
      'CursorColumn',
      'Whitespace',
    }

    blankline.setup({
      indent = {
        highlight = highlight,
        char = ''
      },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    })
  end
}

