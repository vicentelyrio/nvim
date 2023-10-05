return {
  'zbirenbaum/neodim',
  event = 'LspAttach',
  branch = 'v2',
  config = function ()
    local neodim = require('neodim')
    neodim.setup({
      refresh_delay = 75,
      alpha = .75,
      blend_color = "#000000",
      hide = {
        underline = true,
        virtual_text = false,
        signs = true,
      },
      priority = 100,
      disable = {},
    })
  end,
}

