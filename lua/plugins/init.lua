return {
-- BUFFER (buffer control) {{{
  require 'plugins.buffer.cokeline',
  require 'plugins.buffer.bufdelete',
  require 'plugins.buffer.cybu',
-- }}}

-- CODE (code editing improvements) {{{
  require 'plugins.code.blankline',
  require 'plugins.code.colorizer',
  require 'plugins.code.comment',
  require 'plugins.code.scrollbar',
  require 'plugins.code.smartsplits',
  require 'plugins.code.move',
  require 'plugins.code.todo',
  require 'plugins.code.ufo',
  require 'plugins.code.visual-multi',
  require 'plugins.code.treesj',
  require 'plugins.code.treesitter',
  require 'plugins.code.treesitter-textobjects',
-- }}}

-- AI {{{
  require 'plugins.ai.avante',
  require 'plugins.ai.supermaven',
-- }}}

-- GIT {{{
  require 'plugins.git.gitsigns',
  require 'plugins.git.gitconflict',
  require 'plugins.git.wakatime',
-- }}}

-- LANGUAGES (language support) {{{
  require 'plugins.languages.dadbot',
  require 'plugins.languages.better-ts-errors',
  require 'plugins.languages.typescript-tools',
  require 'plugins.languages.vimpio',
  require 'plugins.languages.zip',
-- }}}

-- LSP (language server protocol) {{{
  require 'plugins.lsp.mason',
  require 'plugins.lsp.lspconfig',
  require 'plugins.lsp.lint',
  require 'plugins.lsp.cmp',
  require 'plugins.lsp.trouble',
-- }}}


-- SEARCH (search engine) {{{
  require 'plugins.search.spectre',
-- }}}

-- THEME {{{
  require 'plugins.theme.catppuccin',
-- }}}

-- UI {{{
  require 'plugins.ui.feline',
  require 'plugins.ui.lspkind',
  require 'plugins.ui.neotree',
  require 'plugins.ui.noice',
  require 'plugins.ui.project',
  require 'plugins.ui.telescope',
-- }}}
}

