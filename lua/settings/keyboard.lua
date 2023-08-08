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

g.mapleader = ' '

-- Paste and keep register
map('v', 'p', '"_dP', opts)

-- Visual --
-- Stay in indent mode
map('v', '<', "<gv", opts)
map('v', '>', ">gv", opts)

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

local uiCommands = {
  { 'n', keys.ui.file_explorer, '<cmd>Neotree<CR>' },
  { 'n', keys.ui.colorscheme, '<cmd>Telescope colorscheme<CR>' },
  { 'n', keys.ui.zen_narrow, '<cmd>TZNarrow<CR>' },
  { 'n', keys.ui.zen_focus, '<cmd>TZFocus<CR>' },
  { 'n', keys.ui.zen_minimalist, '<cmd>TZMinimalist<CR>' },
  { 'n', keys.ui.zen_ataraxis, '<cmd>TZAtaraxis<CR>' },
}

local searchCommands = {
  { 'n', keys.search.find_files, '<cmd>Telescope find_files<CR>' },
  { 'n', keys.search.find_word, '<cmd>Telescope live_grep<CR>' },
  { 'n', keys.search.find_history, '<cmd>Telescope zoxide list<CR>' },
  { 'n', keys.search.unselect, '<cmd>nohlsearch<CR>' },
  { 'n', keys.search.prev_select, [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
  { 'n', keys.search.next_select, [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
}

local gitCommands = {
  { 'n', keys.git.status, '<cmd>Telescope git_status<CR>' },
}

local lspCommands = {
  { 'n', keys.lsp.definition, '<cmd>Telescope lsp_definitions<CR>' },
  { 'n', keys.lsp.definition_hover, '<cmd>lua vim.lsp.buf.hover()<CR>' },
  { 'n', keys.lsp.declaration, '<cmd>lua vim.lsp.buf.declaration()<CR>' },
  { 'n', keys.lsp.code_action, '<cmd>lua vim.lsp.buf.code_action()<CR>' },
  { 'n', keys.lsp.diagnostic, '<cmd>TroubleToggle<CR>' },
  { 'n', keys.lsp.references, '<cmd>Trouble lsp_references<CR>' },
}

MapKeys(bufferCommands)
MapKeys(uiCommands)
MapKeys(searchCommands)
MapKeys(gitCommands)
MapKeys(lspCommands)

