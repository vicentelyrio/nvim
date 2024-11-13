return {
  'neovim/nvim-lspconfig',
  cmd = {'LspInfo', 'LspInstall', 'LspStart'},
  event = {'BufReadPre', 'BufNewFile'},
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
  },
  config = function()
    local keys = require 'settings.keyboard.keys'
    local lsp_defaults = require('lspconfig').util.default_config
    local lsp_capabilities = vim.tbl_deep_extend(
      'force',
      require('cmp_nvim_lsp').default_capabilities(),
      {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          },
        },
      }
    )

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      lsp_capabilities
    )

    -- vim.api.nvim_create_autocmd('LspAttach', {
    --   desc = 'LSP actions',
    --   callback = function(event)
    --     local opts = {buffer = event.buf}
    --
    --     local lspCommands = {
    --       { 'n', keys.lsp.definition, '<cmd>Trouble lsp_definitions<CR>' },
    --       { 'n', keys.lsp.definition_hover, '<cmd>lua vim.lsp.buf.hover()<CR>' },
    --       { 'n', keys.lsp.declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>' },
    --       { 'n', keys.lsp.code_action, '<cmd>lua vim.lsp.buf.code_action()<CR>' },
    --       { 'n', keys.lsp.references, '<cmd>Trouble lsp_references<CR>' },
    --       { 'n', keys.lsp.document_diagnostics, '<cmd>Trouble document_diagnostics<CR>' },
    --       { 'n', keys.lsp.workspace_diagnostics, '<cmd>Trouble workspace_diagnostics<CR>'},
    --       { 'n', keys.lsp.quickfix, '<cmd>Trouble quickfix<CR>'},
    --       { 'n', keys.lsp.loclist, '<cmd>Trouble loclist<CR>'},
    --     }
    --
    --     vim.keymap.set('n', keys.lsp.definition_hover, '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    --     vim.keymap.set('n', keys.lsp.definition, '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    --     vim.keymap.set('n', keys.lsp.declaration, '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    --     vim.keymap.set('n', keys.lsp.implementation, '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    --     vim.keymap.set('n', keys.lsp.type_definition, '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    --     vim.keymap.set('n', keys.lsp.references, '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    --     vim.keymap.set('n', keys.lsp.signature_help, '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    --     -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    --     -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    --     -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    --   end,
    -- })

    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = {
        'ansiblels',
        'bashls',
        'cssls',
        'cssmodules_ls',
        'custom_elements_ls',
        'graphql',
        'harper_ls',
        'html',
        'jsonls',
        'lua_ls',
        'sqlls',
        'taplo',
        'vtsls',
        'yamlls',
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      }
    })
  end
}
