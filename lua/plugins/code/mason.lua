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

    -- mason_lspconfig.setup_handlers {
    --   function (server_name)
    --     lspconfig[server_name].setup {}
    --   end,
    -- }

    -- -- [[ Load individual languages setup ]]
    -- local opts = {}
    --
    -- for _, server in pairs(servers) do
    --   server = vim.split(server, '@')[1]
    --
    --   local require_ok, conf_opts = pcall(require, 'plugins.code.languages.' .. server)
    --
    --   if require_ok then
    --     opts = vim.tbl_deep_extend('force', conf_opts, opts)
    --   end
    --
    --   lspconfig[server].setup(opts)
    -- end
  end
}
