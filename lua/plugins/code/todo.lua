-- highlight TODO comments
-- see https://github.com/folke/todo-comments.nvim
return {
  'folke/todo-comments.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('todo-comments').setup()
  end,
}

