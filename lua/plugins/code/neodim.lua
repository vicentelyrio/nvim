local status_ok, neodim = pcall(require, 'neodim')
if not status_ok then return end

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

