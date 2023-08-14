local gitsigns = require('gitsigns')

gitsigns.setup({
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = false,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
})

