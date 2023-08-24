local status_ok, vimpio = pcall(require, 'vim-pio')
if not status_ok then return end

vimpio.setup()

