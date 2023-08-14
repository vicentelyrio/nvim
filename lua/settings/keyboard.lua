local keys = require 'settings.keys'
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

function MapKeys(keycodes)
  for _, row in ipairs(keycodes) do
    local type = row[1]
    local key = row[2]
    local cmd = row[3]

    map(type, key, cmd, opts)
  end
end

vim.g.mapleader = ' '

local bufferCommands = {
  { 'n', keys.buffers.prev, '<cmd>CybuPrev<CR>'},
  { 'n', keys.buffers.next, '<cmd>CybuNext<CR>'},
  { 'n', keys.buffers.last_prev, '<cmd>CybuLastusedPrev<CR>'},
  { 'n', keys.buffers.last_next, '<cmd>CybuLastusedNext<CR>'},
  { 'n', keys.buffers.list, '<cmd>Telescope buffers<CR>'},
  { 'n', keys.buffers.close, '<cmd>Bdelete<CR>'},
  { 'n', keys.buffers.save, '<cmd>w<CR>'},
  { 'n', keys.buffers.new, '<cmd>enew<CR>'},
  { 'n', keys.buffers.history, '<cmd>Telescope oldfiles<CR>'},
  { 'n', keys.buffers.move_left, '<cmd>SmartCursorMoveLeft<CR>'},
  { 'n', keys.buffers.move_right, '<cmd>SmartCursorMoveRight<CR>'},
  { 'n', keys.buffers.move_up, '<cmd>SmartCursorMoveUp<CR>'},
  { 'n', keys.buffers.move_down, '<cmd>SmartCursorMoveDown<CR>'},
  { 'n', keys.buffers.resize_left, '<cmd>SmartResizeLeft<CR>'},
  { 'n', keys.buffers.resize_right, '<cmd>SmartResizeRight<CR>'},
  { 'n', keys.buffers.resize_up, '<cmd>SmartResizeUp<CR>'},
  { 'n', keys.buffers.resize_down, '<cmd>SmartResizeDown<CR>'},
  { 'n', keys.buffers.split_vertical, '<cmd>vsplit<CR>'},
  { 'n', keys.buffers.split_horizontal, '<cmd>split<CR>'},
}

local codeCommands = {
  { 'v', keys.code.paste, '"_dP' },
  { 'v', keys.code.indent_back, '<gv' },
  { 'v', keys.code.indent_forward, '>gv' },
  { 'n', keys.code.move_word_back, '<cmd>MoveWord(-1)<CR>' },
  { 'n', keys.code.move_word_forward, '<cmd>MoveWord(1)<CR>' },
  { 'n', keys.code.move_line_up, '<cmd>MoveLine(-1)<CR>' },
  { 'n', keys.code.move_line_down, '<cmd>MoveLine(1)<CR>' },
  { 'v', keys.code.move_line_up, '<cmd>MoveBlock(-1)<CR>' },
  { 'v', keys.code.move_line_down, '<cmd>MoveBlock(1)<CR>' },
}

local uiCommands = {
  { 'n', keys.ui.file_explorer, '<cmd>Neotree<CR>' },
  { 'n', keys.ui.colorscheme, '<cmd>Telescope colorscheme<CR>' },
}

local searchCommands = {
  { 'n', keys.search.find_files, '<cmd>Telescope find_files<CR>' },
  { 'n', keys.search.find_word, '<cmd>Telescope live_grep<CR>' },
  { 'n', keys.search.find_history, '<cmd>Telescope zoxide list<CR>' },
  { 'n', keys.search.unselect, '<cmd>nohlsearch<CR>' },
  {
    'n', keys.search.prev_select,
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]]
  },
  {
    'n', keys.search.next_select,
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]]
  },
}

local gitCommands = {
  { 'n', keys.git.status, '<cmd>Telescope git_status<CR>' },
}

local lspCommands = {
  { 'n', keys.lsp.definition, '<cmd>TroubleToggle lsp_definitions<CR>' },
  { 'n', keys.lsp.definition_hover, '<cmd>lua vim.lsp.buf.hover()<CR>' },
  { 'n', keys.lsp.declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>' },
  { 'n', keys.lsp.code_action, '<cmd>lua vim.lsp.buf.code_action()<CR>' },
  { 'n', keys.lsp.references, '<cmd>Trouble lsp_references<CR>' },
  { 'n', keys.lsp.document_diagnostics, '<cmd>TroubleToggle document_diagnostics<CR>' },
  { 'n', keys.lsp.workspace_diagnostics, '<cmd>TroubleToggle workspace_diagnostics<CR>'},
  { 'n', keys.lsp.quickfix, '<cmd>TroubleToggle quickfix<CR>'},
  { 'n', keys.lsp.loclist, '<cmd>TroubleToggle loclist<CR>'},
}

MapKeys(bufferCommands)
MapKeys(uiCommands)
MapKeys(searchCommands)
MapKeys(gitCommands)
MapKeys(lspCommands)
MapKeys(codeCommands)
