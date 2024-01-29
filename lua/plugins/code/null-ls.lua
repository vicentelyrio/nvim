return {
  'nvimtools/none-ls.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local null_ls = require('null-ls')

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
    local completion = null_ls.builtins.completion

    null_ls.setup({
      debug = false,
      sources = {
        formatting.trim_whitespace,
        formatting.trim_newlines,

        diagnostics.dotenv_linter,
        diagnostics.stylint,
        diagnostics.tidy,
        -- diagnostics.tsc,
        -- diagnostics.standardjs,
        diagnostics.todo_comments,
        diagnostics.trail_space,

        -- completion.spell,
        completion.vsnip,
        completion.luasnip,
      },
    })
  end
}
