local status_ok, nvim_scrollbar = pcall(require, "scrollbar")
if not status_ok then
  return
end

nvim_scrollbar.setup()

require("scrollbar.handlers.search").setup()
require("scrollbar.handlers.gitsigns").setup()
