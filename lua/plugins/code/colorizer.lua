-- show colors in code
-- https://github.com/NvChad/nvim-colorizer.lua
return {
  'NvChad/nvim-colorizer.lua',
  event = "VeryLazy",
  config = function()
    require('colorizer').setup({}, { names = false })
  end
}
