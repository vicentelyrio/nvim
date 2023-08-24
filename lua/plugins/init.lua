return {
  -- Theme {{{
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  -- }}}

  -- Mason {{{
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require 'plugins.code.mason'
    end
  },
  -- }}}

  -- Null LS {{{
  {
    'jose-elias-alvarez/null-ls.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jose-elias-alvarez/typescript.nvim'
    },
    config = function()
      require 'plugins.code.null-ls'
    end
  },
  -- }}}

  -- CMP {{{
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require 'plugins.code.cmp'
    end
  },
  -- }}}

  -- LSP Kind {{{
  {
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
      require 'plugins.code.lspk'
    end
  },
  -- }}}

  -- Trouble {{{
  {
    'folke/trouble.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'plugins.code.trouble'
    end,
  },
  -- }}}

  -- TreeSitter {{{
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require 'plugins.code.treesitter'
    end
  },
  -- }}}

  -- Comments {{{
  {
    'numToStr/Comment.nvim',
    lazy = false,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function()
      require 'plugins.code.comment'
    end
  },
  -- }}}

  -- Todo Comments {{{
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require 'plugins.code.todo'
    end,
  },
  -- }}}

  -- Neodim {{{
  {
    'zbirenbaum/neodim',
    event = 'LspAttach',
    branch = 'v2',
    config = function ()
      require 'plugins.code.neodim'
    end,
  },
  -- }}}

  -- Colorizer {{{
  {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require 'plugins.code.colorizer'
    end,
  },
  -- }}}

  -- UFO Code Folding {{{
  {
    'kevinhwang91/nvim-ufo',
    lazy = false,
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      require 'plugins.code.ufo'
    end
  },
  -- }}}

  -- hlslens {{{
  {
    'kevinhwang91/nvim-hlslens',
    lazy = false,
    config = function()
      require 'plugins.code.hlslens'
    end
  },
  -- }}}

  -- Move {{{
  {
    'fedepujol/move.nvim',
    lazy = false,
  },
  -- }}}

  -- Indent {{{
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    config = function()
      require 'plugins.code.blankline'
    end
  },
  --- }}}

  -- Git Signs {{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require 'plugins.git.gitsigns'
    end
  },
  -- }}}

  -- Git Conflict {{{
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true
  },
  -- }}}

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ahmedkhalf/project.nvim',
      'jvgrootveld/telescope-zoxide',
    },
    config = function()
      require 'plugins.ui.telescope'
    end
  },
  -- }}}

  -- Neo Tree {{{
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function ()
      require 'plugins.ui.neotree'
    end
  },
  -- }}}

  -- Feline {{{
  {
    'freddiehaddad/feline.nvim',
    lazy = false,
    config = function ()
      require 'plugins.ui.feline'
    end
  },
  -- }}}

  -- Smart Splits {{{
  {
    'mrjones2014/smart-splits.nvim'
  },
  -- }}}

  -- Cybu Buffer navigation {{{
  {
    'ghillb/cybu.nvim',
    lazy = false,
    config = function ()
      require 'plugins.ui.cybu'
    end
  },
  -- }}}

  -- BufDelete Buffer close improved {{{
  {
    'famiu/bufdelete.nvim',
    lazy = false,
  },
  -- }}}

  -- Scroll {{{
  {
    'petertriho/nvim-scrollbar',
    lazy = false,
    config = function ()
      require 'plugins.ui.scrollbar'
    end
  },
  -- }}}

  -- PIO - PlatformIO {{{
  {
    'normen/vim-pio',
    lazy = false,
    config = function()
      require 'plugins.code.vimpio'
    end
  },
  -- }}}
}
