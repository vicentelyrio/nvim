local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
  provider_selector = function()
    return { "treesitter", "indent" }
  end
})

