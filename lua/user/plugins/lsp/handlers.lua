local keys = require "user.keys"

local mapKey = keys.mapKey
local leaderKeys = keys.leaderKeys
local superKeys = keys.superKeys
local ctrlKeys = keys.ctrlKeys
local altKeys = keys.altKeys
local singleKeys = keys.singleKeys

local keymap = vim.api.nvim_buf_set_keymap

local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  keymap(bufnr, "n", singleKeys.gD, "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", singleKeys.gd, "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", singleKeys.gi, "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", singleKeys.gr, "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", singleKeys.gl, '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", singleKeys.ga, "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(bufnr, "n", singleKeys.gb, ":ToggleBlameLine<CR>", opts)
  keymap(bufnr, "n", singleKeys.K, "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  keymap(bufnr, "n", singleKeys.gh, "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", singleKeys.bracketBack, '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", singleKeys.bracketNext, '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  keymap(bufnr, "n", mapKey("<leader>%s", leaderKeys.q), "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  keymap(bufnr, "n", mapKey("<leader>%s", leaderKeys.br), "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap(bufnr, "n", mapKey("<leader>%s", leaderKeys.fd), "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  -- disable formatter for tsserver
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M

