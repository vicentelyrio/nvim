-- manage lsp diagnostics and code actions
-- see https://github.com/nvimtools/none-ls.nvim

return {
  'nvimtools/none-ls.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'none-ls-extras.nvim',
    'nvimtools/none-ls-extras.nvim'
  },
  config = function()
    local none_ls = require('null-ls')
    local actions = none_ls.builtins.code_actions
    local formatting = none_ls.builtins.formatting
    -- local diagnostics = none_ls.builtins.diagnostics
    local hover = none_ls.builtins.hover

    none_ls.setup({
      debug = false,
      sources = {
        actions.gitsigns,

        formatting.cueimports,

        -- require('none-ls.diagnostics.eslint'),
        -- diagnostics.actionlint,
        -- diagnostics.ansiblelint,
        -- diagnostics.checkmake,
        -- diagnostics.codespell,
        -- diagnostics.cppcheck,
        -- diagnostics.dotenv_linter,
        -- diagnostics.editorconfig_checker,
        -- diagnostics.gdlint,
        -- diagnostics.hadolint,
        -- diagnostics.markdownlint,
        -- diagnostics.tidy,
        -- diagnostics.todo_comments,
        -- diagnostics.trail_space,
        -- diagnostics.stylelint,
        -- diagnostics.trivy,
        -- diagnostics.yamllint,
        -- diagnostics.zsh,

        hover.printenv
      },
    })
  end
}
