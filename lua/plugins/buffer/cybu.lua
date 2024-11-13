return {
  'ghillb/cybu.nvim',
  event = 'VeryLazy',
  config = function ()
    require('cybu').setup()
  end
}

