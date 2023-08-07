return {
  -- Theme {{{
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  -- }}}

  -- Neo Tree {{{
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function ()
      require 'plugins.configs.neotree'
    end
  },
  -- }}}
  -- TreeSitter {{{
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require 'plugins.configs.treesitter'
    end
  },
  -- }}}
}
