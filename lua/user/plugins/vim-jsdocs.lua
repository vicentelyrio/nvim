local status_ok, jsdocs = pcall(require, "vim-jsdocs")
if not status_ok then
  return
end

jsdocs.setup()

