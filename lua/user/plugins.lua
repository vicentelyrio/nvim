local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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
  use { "catppuccin/nvim", as = "catppuccin" }        -- Theme
  use "nvim-tree/nvim-web-devicons"                   -- Icons
  use "norcalli/nvim-colorizer.lua"                   -- Colorize color values
  use "petertriho/nvim-scrollbar"                     -- Scrollbar feedback
  use "ghillb/cybu.nvim"                              -- Buffer navigation with preview
  use "famiu/bufdelete.nvim"                          -- Buffer close improved
  use "mrjones2014/smart-splits.nvim"                 -- Buffer Navigation
  use "feline-nvim/feline.nvim"                       -- Status Line
  use "nvim-pack/nvim-spectre"                        -- Find & Replace
  use "kevinhwang91/nvim-hlslens"                     -- search highlight

  -- File explorer
  use "nvim-tree/nvim-tree.lua"                       -- Sidebar Explorer
  use "gaborvecsei/memento.nvim"                      -- Last opened Buffers

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "jvgrootveld/telescope-zoxide"
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }

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

  -- Languages Support
  use "sheerun/vim-polyglot"                          -- Syntax highlight for multiple languages
  use "gennaro-tedesco/nvim-jqx"                      -- JSON tools

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

  -- Text edition
  use "kylechui/nvim-surround"

  -- Zen mode
  use "Pocco81/true-zen.nvim"

  -- Multi cursor
  use "mg979/vim-visual-multi"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "akinsho/git-conflict.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

