return {
  'nvimtools/none-ls.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local null_ls = require('null-ls')
    local actions = null_ls.builtins.code_actions
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion

    null_ls.setup({
      debug = false,
      sources = {
        actions.gitsigns,

        completion.luasnip,

        formatting.cueimports,

        diagnostics.codespell,
        diagnostics.dotenv_linter,
        diagnostics.editorconfig_checker,
        diagnostics.markdownlint,
        diagnostics.stylelint,
        diagnostics.tidy,
        diagnostics.todo_comments,
        diagnostics.trail_space,
        diagnostics.yamllint,
      },
    })
  end
}
