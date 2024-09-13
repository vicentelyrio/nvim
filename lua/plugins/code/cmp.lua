return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspk = require('lspkind')
    local keys = require 'settings.keyboard.keys'
    local fn = vim.fn

    local check_backspace = function()
      local col = fn.col '.' - 1
      return col == 0 or fn.getline('.'):sub(col, col):match '%s'
    end

    local opts = { 'i', 'c' }

    cmp.setup{
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body) -- Luasnip expand
        end,
      },

      mapping = {
        [keys.cmp.select_prev] = cmp.mapping.select_prev_item(),
        [keys.cmp.select_next] = cmp.mapping.select_next_item(),
        [keys.cmp.scroll_prev] = cmp.mapping(cmp.mapping.scroll_docs(-1), opts),
        [keys.cmp.scroll_next] = cmp.mapping(cmp.mapping.scroll_docs(1), opts),
        [keys.cmp.complete] = cmp.mapping(cmp.mapping.complete(), opts),
        [keys.cmp.disable] = cmp.config.disable,
        [keys.cmp.abort] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        [keys.cmp.select] = cmp.mapping.confirm { select = false },
        [keys.cmp.cycle_next] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { 'i', 's' }),
        [keys.cmp.cycle_prev] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = lspk.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          symbol_map = { Supermaven = "" }
        }),
      },
      sources = {
        { name = 'supermaven' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'tmux' },
        { name = 'path' },
        { name = 'emoji' },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = false,
      },
    }

    -- Add snippets from Friendly Snippets
    require('luasnip/loaders/from_vscode').lazy_load()

  end
}


