-- comment enhancer
-- see https://github.com/numToStr/Comment.nvim
return {
  'numToStr/Comment.nvim',
  lazy = false,
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  config = function()
    local comment = require('Comment')

    comment.setup()
  end
}

