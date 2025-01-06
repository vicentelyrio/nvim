return {
  'lukas-reineke/indent-blankline.nvim',
  event = "VeryLazy",
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

