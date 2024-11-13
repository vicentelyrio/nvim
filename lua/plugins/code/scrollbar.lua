-- see https://github.com/petertriho/nvim-scrollbar
return {
  'petertriho/nvim-scrollbar',
  event = 'VeryLazy',
  config = function ()
    require('scrollbar').setup()
    -- require('scrollbar.handlers.search').setup()
    require('scrollbar.handlers.gitsigns').setup()
  end
}

