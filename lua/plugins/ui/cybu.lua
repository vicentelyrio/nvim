local keys = require('settings.keyboard.keys')

return {
  'ghillb/cybu.nvim',
  cmd = { 'CybuPrev', 'CybuNext', 'CybuLastusedPrev', 'CybuLastusedNext' },
  keys = { keys.buffers.prev, keys.buffers.next },
  config = function ()
    require('cybu').setup()
  end
}
