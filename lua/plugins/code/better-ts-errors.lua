local keys = require 'settings.keyboard.keys'

return {
  'OlegGulevskyy/better-ts-errors.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = {
    keymaps = {
      toggle = keys.ts.toggle,
      go_to_definition = keys.ts.go_to_definition
    }
  }
}
