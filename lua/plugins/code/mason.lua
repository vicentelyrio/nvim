return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
      cmd = {
        'Mason',
        'MasonInstall',
        'MasonUninstall',
        'MasonUninstallAll',
        'MasonLog',
        'MasonUpdate',
      },
    },
    'neovim/nvim-lspconfig',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  init = function()
    vim.api.nvim_create_user_command('LspLog', function()
      vim.cmd.edit(vim.lsp.log.get_filename())
    end, { desc = 'Open LSP log file' })
  end,
  config = function()
    local mason_servers = {
      'bashls',
      'cssmodules_ls',
      'html',
      'jsonls',
      'lua_ls',
      -- biome: lint diagnostics + code actions only, no ts_ls/formatter
      -- overlap issues since we never call vim.lsp.buf.format for it
      'biome',
    }

    local exclude_from_auto_enable = {}

    -- tsgo (microsoft/typescript-go) isn't in mason's registry yet, install
    -- separately: npm install -g @typescript/native-preview
    local manual_servers = { 'tsgo' }

    local function get_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink_cmp = pcall(require, 'blink.cmp')
      if ok then
        capabilities = blink_cmp.get_lsp_capabilities(capabilities)
      end
      return capabilities
    end

    vim.lsp.config('*', {
      capabilities = get_capabilities(),
    })

    local function configure(server)
      local ok, override = pcall(require, 'plugins.code.languages.' .. server)
      if ok and type(override) == 'table' then
        vim.lsp.config(server, override)
      end
    end

    for _, server in ipairs(mason_servers) do
      configure(server)
    end
    for _, server in ipairs(manual_servers) do
      configure(server)
    end

    require('mason-lspconfig').setup({
      ensure_installed = mason_servers,
      automatic_enable = {
        exclude = exclude_from_auto_enable,
      },
    })

    for _, server in ipairs(manual_servers) do
      vim.lsp.enable(server)
    end

    -- Diagnostics UI (previously left at Neovim defaults)
    vim.diagnostic.config({
      severity_sort = true,
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 2, source = 'if_many', prefix = '●' },
      float = { border = 'rounded', source = 'if_many' },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '',
          [vim.diagnostic.severity.INFO] = '',
        },
      },
    })

    -- Inlay hints: on by default, toggle with keys.lsp.toggle_inlay_hints
    local keys = require('settings.keyboard.keys')
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp_inlay_hints', { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/inlayHint') then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
      end,
    })
    vim.keymap.set('n', keys.lsp.toggle_inlay_hints, function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, { noremap = true, silent = true, desc = 'Toggle LSP inlay hints' })
  end,
}
