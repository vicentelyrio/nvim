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
      'html',
      'jsonls',
      'lua_ls',
    }

    mason.setup()

    -- Get capabilities helper function
    local function get_capabilities()
      local ok, blink_cmp = pcall(require, 'blink.cmp')
      if ok then
        return blink_cmp.get_lsp_capabilities()
      end
      return vim.lsp.protocol.make_client_capabilities()
    end

    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
      handlers = {
        function (server_name)
          lspconfig[server_name].setup({
            capabilities = get_capabilities()
          })
        end,
      }
    })
  end
}
