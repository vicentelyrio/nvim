-- lsp manager
-- see https://github.com/williamboman/mason.nvim
return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    local servers = {
      'bashls',
      'cssmodules_ls',
      'graphql',
      'html',
      'jsonls',
      'lua_ls',
    }

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })


    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
      handlers = {
        function (server_name)
          local server = lspconfig[server_name]
          local capabilities = require('blick.cmp').get_lsp_capabilities(server.capabilities)
          server.setup { capabilities = capabilities }
        end,
      }
    })
  end
}
