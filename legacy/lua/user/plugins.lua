-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Core
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- UI
  use "famiu/bufdelete.nvim"                          -- Buffer close improved
  use { "catppuccin/nvim", as = "catppuccin" }        -- Theme
  use "norcalli/nvim-colorizer.lua"                   -- Colorize color values
  use "ghillb/cybu.nvim"                              -- Buffer navigation with preview
  use "feline-nvim/feline.nvim"                       -- Status Line
  use "gaborvecsei/memento.nvim"                      -- Last opened Buffers
  use "petertriho/nvim-scrollbar"                     -- Scrollbar feedback
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"                   -- Icons
  use "mrjones2014/smart-splits.nvim"                 -- Buffer Navigation
  use "nvim-telescope/telescope.nvim"
  use "jvgrootveld/telescope-zoxide"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Search
  use "nvim-pack/nvim-spectre"                        -- Find & Replace
  use "kevinhwang91/nvim-hlslens"                     -- search highlight

  -- Code Completion
  use "hrsh7th/nvim-cmp"                              -- The completion plugin
  use "hrsh7th/cmp-buffer"                            -- buffer completions
  use "hrsh7th/cmp-path"                              -- path completions
  use "hrsh7th/cmp-cmdline"                           -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"                          -- lsp completions
  use "hrsh7th/cmp-nvim-lua"                          -- lua completions
  use "tamago324/cmp-zsh"                             -- zsh completions
  use "saadparwaiz1/cmp_luasnip"                      -- snippet completions
  use "andersevenrud/cmp-tmux"                        -- tmux completions
  use "David-Kunz/cmp-npm"                            -- npm completions

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  }
  use "rafamadriz/friendly-snippets"

	-- LSP
  use "neovim/nvim-lspconfig"                         -- LSP
  use "williamboman/mason.nvim"                       -- LSP installer
  use "williamboman/mason-lspconfig.nvim"             -- LSP installer config
  use 'jose-elias-alvarez/null-ls.nvim'               -- LSP diagnostics and code actions

  -- MOTION
  use 'ggandor/lightspeed.nvim'                       -- Jump
  use "mg979/vim-visual-multi"                        -- Multi cursor
  use "kylechui/nvim-surround"

  -- JSDOCS
  use { 'heavenshell/vim-jsdoc', run = 'make install' }

  -- Languages Support
  use "gennaro-tedesco/nvim-jqx"                      -- JSON tools
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- Dim unused vars
  use {
    "zbirenbaum/neodim",
    event = "LspAttach"
  }

  -- Code Folding
  use {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async"
  }

  -- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Zen mode
  use "Pocco81/true-zen.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "akinsho/git-conflict.nvim"
  use "tveskag/nvim-blame-line"

  -- AI
  use {
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

