local opts = { noremap = true, silent = true }

local keys = require "user.keys"

local mapKey = keys.mapKey
local leaderKeys = keys.leaderKeys
local altKeys = keys.altKeys
local singleKeys = keys.singleKeys

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keybind mapper
local function mapKeys(commands)
  for _, row in ipairs(commands) do
    local key = row[1]
    local cmd = row[2]

    keymap('n', key, cmd, opts)
  end
end

-- Modes
--   normal_mode        = "n"
--   insert_mode        = "i"
--   visual_mode        = "v"
--   visual_block_mode  = "x"
--   term_mode          = "t"
--   command_mode       = "c"

--
-- Buffers
local bufferCommands = {
  { keys.buffers.prev, ':CybuPrev<CR>'},
  { keys.buffers.next, ':CybuNext<CR>'},
  { keys.buffers.last_prev, ':CybuLastusedPrev<CR>'},
  { keys.buffers.last_next, ':CybuLastusedNext<CR>'},
  { keys.buffers.close, ':Bdelete<CR>'},
  { keys.buffers.save, ':w<CR>'},
  { keys.buffers.new, ':enew<CR>'},
  { keys.buffers.history, ':MementoToggle<CR>'},
  { keys.buffers.move_left, ':SmartCursorMoveLeft<CR>'},
  { keys.buffers.move_right, ':SmartCursorMoveRight<CR>'},
  { keys.buffers.move_up, ':SmartCursorMoveUp<CR>'},
  { keys.buffers.move_down, ':SmartCursorMoveDown<CR>'},
  { keys.buffers.resize_left, ':SmartResizeLeft<CR>'},
  { keys.buffers.resize_right, ':SmartResizeRight<CR>'},
  { keys.buffers.resize_up, ':SmartResizeUp<CR>'},
  { keys.buffers.resize_down, ':SmartResizeDown<CR>'},
  { keys.buffers.split_vertical, ':vsplit<CR>'},
  { keys.buffers.split_horizontal, ':split<CR>'},
}

local uiCommands = {
  { keys.ui.file_explorer, '<cmd>NvimTreeToggle<CR>' },
  { keys.ui.colorscheme, '<cmd>Telescope colorscheme<CR>' },
  { keys.ui.zen_narrow, ':TZNarrow<CR>' },
  { keys.ui.zen_focus, ':TZFocus<CR>' },
  { keys.ui.zen_minimalist, ':TZMinimalist<CR>' },
  { keys.ui.zen_ataraxis, ':TZAtaraxis<CR>' },
}

local searchCommands = {
  { keys.search.find_files, '<cmd>Telescope find_files<CR>' },
  { keys.search.find_word, '<cmd>Telescope live_grep<CR>' },
  { keys.search.find_history, '<cmd>Telescope zoxide list<CR>' },
}

local gitCommands = {
  { keys.git.status, '<cmd>Telescope git_status<CR>' },
  { keys.git.blame, ':ToggleBlameLine<CR>' },
}

mapKeys(bufferCommands)
mapKeys(uiCommands)
mapKeys(searchCommands)
mapKeys(gitCommands)

-- Highlight
keymap('n', mapKey("<leader>%s", leaderKeys.h), ":nohlsearch<CR>", opts)
keymap('n', mapKey("<leader>%s", leaderKeys.n), [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
keymap('n', mapKey("<leader>%s", leaderKeys.N), [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)

-- Paste and keep register
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", singleKeys.backSlash, "<gv", opts)
keymap("v", singleKeys.forwardSlash, ">gv", opts)

-- Move text up and down
keymap("v", mapKey("<A-%s>", altKeys.j), ":m .+1<CR>==", opts)
keymap("v", mapKey("<A-%s>", altKeys.k), ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", singleKeys.J, ":move '>+1<CR>gv-gv", opts)
keymap("x", singleKeys.K, ":move '<-2<CR>gv-gv", opts)
keymap("x", mapKey("<A-%s>", altKeys.j), ":move '>+1<CR>gv-gv", opts)
keymap("x", mapKey("<A-%s>", altKeys.k), ":move '<-2<CR>gv-gv", opts)
