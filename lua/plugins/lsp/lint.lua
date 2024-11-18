return {
  'mfussenegger/nvim-lint',
  dependencies = {
    'rshkarin/mason-nvim-lint'
  },
  event = { 'BufWritePre', 'BufEnter' },
  opts = {
    linters = {
      eslint_d = {
        args = {
          '--no-warn-ignored',
          '--format',
          'json',
          '--stdin',
          '--stdin-filename',
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      },
    },
  },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      typescript = { 'eslint_d' },
      javascript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      html = { 'htmlhint' },
      css = { 'stylelint' },
      scss = { 'stylelint' },
      json = { 'jsonlint' },
      yaml = { 'yamllint' },
      markdown = { 'markdownlint' },
      sh = { 'shellcheck' },
      lua = { 'luacheck' },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })

    require ('mason-nvim-lint').setup({
      ensure_installed = {
        'eslint_d',
        'htmlhint',
        'stylelint',
        'jsonlint',
        'yamllint',
        'markdownlint',
        'shellcheck',
        'luacheck',
      }
    })
  end
}
