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
  require 'plugins.code.zip',
-- }}}

-- COMPLETION {{{
  require 'plugins.completion.supermaven',
  require 'plugins.code.cmp',
  -- require 'plugins.code.dadbot',
  -- require 'plugins.code.mason',
  -- require 'plugins.code.none-ls',
  -- require 'plugins.code.treesitter',
  -- require 'plugins.code.treesitter-textobjects',
-- }}}

-- GIT {{{
  require 'plugins.git.gitsigns',
  require 'plugins.git.gitconflict',
  require 'plugins.git.wakatime',
-- }}}

-- LANGUAGES (language support) {{{
  require 'plugins.languages.better-ts-errors',
  require 'plugins.languages.vimpio',
-- }}}

-- SEARCH (search engine) {{{
  require 'plugins.search.spectre',
-- }}}

-- THEME {{{
  require 'plugins.theme.catppuccin',
-- }}}

-- UI {{{
  require 'plugins.ui.avante',
  require 'plugins.ui.feline',
  require 'plugins.ui.lspkind',
  require 'plugins.ui.neotree',
  require 'plugins.ui.noice',
  require 'plugins.ui.project',
  require 'plugins.ui.telescope',
  require 'plugins.ui.trouble',
-- }}}
}

