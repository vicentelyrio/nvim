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
      'ts_ls',
    }

    local exclude_from_auto_enable = {}

    local manual_servers = {}

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
  end,
}
