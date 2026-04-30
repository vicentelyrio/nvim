return {
  'ghillb/cybu.nvim',
  cmd = { 'CybuPrev', 'CybuNext', 'CybuLastusedPrev', 'CybuLastusedNext' },
  config = function ()
    require('cybu').setup()
  end
}
