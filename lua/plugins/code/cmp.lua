-- Require Completion Plugin
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then return end

-- Require Snippet Plugin
local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then return end

-- Require LspKind Plugin
local kind_status_ok, lspkind = pcall(require, 'lspkind')
if not kind_status_ok then return end

local keys = require 'settings.keys'

local check_backspace = function()
  local col = fn.col '.' - 1
  return col == 0 or fn.getline('.'):sub(col, col):match '%s'
end

cmp.setup{
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end,
  },

  mapping = {
    [keys.cmp.select_prev] = cmp.mapping.select_prev_item(),
		[keys.cmp.select_next] = cmp.mapping.select_next_item(),
    [keys.cmp.scroll_prev] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    [keys.cmp.scroll_next] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    [keys.cmp.complete] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    [keys.cmp.disable] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
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
    end, {
      'i',
      's',
    }),
    [keys.cmp.cycle_prev] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
    }),
  },
  sources = {
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

