local keys = require "user.keys"
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')

local commands = {
  {
    keys.lsp.declaration,
    '<cmd>lua vim.lsp.buf.declaration()<CR>',
    true
  },
  {
    keys.lsp.implementation,
    '<cmd>lua vim.lsp.buf.implementation()<CR>',
    true
  },
  {
    keys.lsp.references,
    builtin.lsp_references,
    --[[ '<cmd>lua vim.lsp.buf.references()<CR>', ]]
    true
  },
  {
    keys.lsp.signature,
    '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    true
  },
  {
    keys.lsp.definition,
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    true
  },
  {
    keys.lsp.definition_hover,
    '<cmd>lua vim.lsp.buf.hover()<CR>',
    true
  },
  {
    keys.lsp.code_action,
    '<cmd>lua vim.lsp.buf.code_action()<CR>',
    true
  },
  {
    keys.lsp.diagnostic,
    '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>'
  },
  {
    keys.lsp.diagnostic_prev,
    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>'
  },
  {
    keys.lsp.diagnostic_next,
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>'
  },
  {
    keys.lsp.diagnostic_setloclist,
    '<cmd>lua vim.diagnostic.setloclist()<CR>'
  },
}

local function lsp_keymaps(bufnr)
  for _, row in ipairs(commands) do
    local key = row[1]
    local cmd = row[2]
    local buffer = row[3]

    if buffer == true then
      keymap.set(bufnr, 'n', key, cmd, opts)
    else
      keymap.set('n', key, cmd, opts)
    end
  end

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

return {
  lsp_keymaps
}
