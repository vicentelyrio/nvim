local keys = require 'settings.keyboard.keys'
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
  { 'n', keys.buffers.last_prev, '<cmd>CybuPrev<CR>'},
  { 'n', keys.buffers.last_next, '<cmd>CybuNext<CR>'},
  { 'n', keys.buffers.list, '<cmd>lua Pick_buffer()<CR>'},
  { 'n', keys.buffers.close, '<cmd>Bdelete<CR>'},
  { 'n', keys.buffers.save, '<cmd>w<CR>'},
  { 'n', keys.buffers.new, '<cmd>enew<CR>'},
  { 'n', keys.buffers.history, '<cmd>Tv recent-files<CR>'},
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
  { 'n', keys.ui.file_explorer, '<cmd>Neotree toggle<CR>' },
  -- keys.ui.colorscheme is bound by plugins/ui/tv.lua (vim.ui.select fallback)
  { 'n', keys.ui.notifi_dismiss, '<cmd>NoiceDismiss<CR>' },
}

local quickfixCommands = {
  { 'n', keys.quickfix.open, '<cmd>copen<CR>' },
  { 'n', keys.quickfix.close, '<cmd>cclose<CR>' },
  { 'n', keys.quickfix.next, '<cmd>cnext<CR>' },
  { 'n', keys.quickfix.prev, '<cmd>cprev<CR>' },
}

function Get_project_root()
  local util = require('lspconfig.util')
  return util.root_pattern('.git', 'package.json')(vim.fn.expand('%:p')) or vim.fn.getcwd()
end

-- Native buffer picker (replaces Telescope buffers)
function Pick_buffer()
  local bufs = vim.tbl_filter(function(b)
    return vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted
  end, vim.api.nvim_list_bufs())

  local items = {}
  for _, b in ipairs(bufs) do
    local name = vim.api.nvim_buf_get_name(b)
    table.insert(items, {
      bufnr = b,
      label = (name == '' and '[No Name]' or vim.fn.fnamemodify(name, ':~:.')),
    })
  end

  vim.ui.select(items, {
    prompt = 'Buffers',
    format_item = function(item) return item.label end,
  }, function(choice)
    if choice then vim.api.nvim_set_current_buf(choice.bufnr) end
  end)
end

local searchCommands = {
  -- keys.search.find_files, find_word, find_history are bound by plugins/ui/tv.lua
  { 'n', keys.search.find_buffers, '<cmd>lua Pick_buffer()<CR>' },
  { 'n', keys.search.unselect, '<cmd>nohlsearch<CR>' },
  {
    'n', keys.search.spectre_open,
    [[<Cmd>lua require("spectre").toggle()<CR>]]
  },
  {
    'n', keys.search.spectre_find_word,
    [[<Cmd>lua require("spectre").open_visual({select_word=true})<CR>]]
  },
  {
    'v', keys.search.spectre_find_word,
    [[<esc><Cmd>lua require("spectre").open_visual()<CR>]]
  },
  {
    'n', keys.search.spectre_find_file,
    [[<Cmd>lua require("spectre").open_file_search({select_word=true})<CR>]]
  },
}

-- git keymaps (keys.git.status, keys.git.log) are bound by plugins/ui/tv.lua
local gitCommands = {}

local lspCommands = {
  { 'n', keys.lsp.document_diagnostics, '<cmd>Trouble document_diagnostics<CR>' },
  { 'n', keys.lsp.workspace_diagnostics, '<cmd>Trouble workspace_diagnostics<CR>'},
  { 'n', keys.lsp.quickfix, '<cmd>Trouble quickfix<CR>'},
  { 'n', keys.lsp.loclist, '<cmd>Trouble loclist<CR>'},
}

MapKeys(bufferCommands)
MapKeys(uiCommands)
MapKeys(quickfixCommands)
MapKeys(searchCommands)
MapKeys(gitCommands)
MapKeys(lspCommands)
MapKeys(codeCommands)
