local opts = { noremap = true, silent = true }
--[[ local expr_opts = { noremap = true, expr = true, silent = true } ]]

local keys = require "user.keys"

local mapKey = keys.mapKey
local leaderKeys = keys.leaderKeys
local superKeys = keys.superKeys
local ctrlKeys = keys.ctrlKeys
local altKeys = keys.altKeys
local singleKeys = keys.singleKeys

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Buffers
-- Navigate buffers
keymap("n", mapKey("<S-%s>", superKeys.l), ":CybuNext<CR>", opts)
keymap("n", mapKey("<S-%s>", superKeys.h), ":CybuPrev<CR>", opts)

keymap("n", mapKey("<S-%s>", superKeys.tab), ":CybuLastusedPrev<CR>", opts)
keymap("n", mapKey("<%s>", singleKeys.tab), ":CybuLastusedNext<CR>", opts)

-- Close buffers
keymap("n", mapKey("<leader>%s", leaderKeys.c), ":Bdelete<CR>", opts)

-- Save buffer
keymap("n", mapKey("<leader>%s", leaderKeys.w), ":w<CR>", opts)

-- New empty buffer
keymap("n", mapKey("<leader>%s", leaderKeys.a), ":enew<CR>", opts)

-- Last Opened buffers
keymap("n", mapKey("<leader>%s", leaderKeys.t), ":MementoToggle<CR>", opts)

-- Highlight
keymap('n', mapKey("<leader>%s", leaderKeys.h), ":nohlsearch<CR>", opts)
keymap('n', mapKey("<leader>%s", leaderKeys.n), [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
keymap('n', mapKey("<leader>%s", leaderKeys.N), [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)

--[[ -- Press jk fast to enter ]]
--[[ keymap("i", "jk", "<ESC>", opts) ]]
--[[ keymap("t", "jk", "<C-\\><C-n>", opts) ]]

-- Visual --
-- Stay in indent mode
keymap("v", singleKeys.backSlash, "<gv", opts)
keymap("v", singleKeys.forwardSlash, ">gv", opts)

-- Move text up and down
keymap("v", mapKey("<A-%s>", altKeys.j), ":m .+1<CR>==", opts)
keymap("v", mapKey("<A-%s>", altKeys.k), ":m .-2<CR>==", opts)

-- Paste and keep register
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", singleKeys.J, ":move '>+1<CR>gv-gv", opts)
keymap("x", singleKeys.K, ":move '<-2<CR>gv-gv", opts)
keymap("x", mapKey("<A-%s>", altKeys.j), ":move '>+1<CR>gv-gv", opts)
keymap("x", mapKey("<A-%s>", altKeys.k), ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", mapKey("<leader>%s", leaderKeys.ff), "<cmd>Telescope find_files<cr>", opts)
keymap("n", mapKey("<leader>%s", leaderKeys.fw), "<cmd>Telescope live_grep<cr>", opts)
keymap("n", mapKey("<leader>%s", leaderKeys.fc), "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", mapKey("<leader>%s", leaderKeys.fg), "<cmd>Telescope git_status<cr>", opts)
keymap("n", mapKey("<leader>%s", leaderKeys.fz), "<cmd>Telescope zoxide list<cr>", opts)

-- Nvimtree
keymap("n", mapKey("<leader>%s", leaderKeys.e), ":NvimTreeToggle<cr>", opts)

-- Zen mode
keymap("n", mapKey("<leader>%s", leaderKeys.zn), ":TZNarrow<CR>", {})
keymap("v", mapKey("<leader>%s", leaderKeys.zn), ":'<,'>TZNarrow<CR>", {})
keymap("n", mapKey("<leader>%s", leaderKeys.zf), ":TZFocus<CR>", {})
keymap("n", mapKey("<leader>%s", leaderKeys.zm), ":TZMinimalist<CR>", {})
keymap("n", mapKey("<leader>%s", leaderKeys.za), ":TZAtaraxis<CR>", {})

-- Git
--

-- Navigation
--
-- moving between splits
keymap("n", mapKey("<C-%s>", ctrlKeys.h), ":SmartCursorMoveLeft<CR>", opts)
keymap("n", mapKey("<C-%s>", ctrlKeys.j), ":SmartCursorMoveDown<CR>", opts)
keymap("n", mapKey("<C-%s>", ctrlKeys.k), ":SmartCursorMoveUp<CR>", opts)
keymap("n", mapKey("<C-%s>", ctrlKeys.l), ":SmartCursorMoveRight<CR>", opts)

keymap("n", mapKey("<S-%s>", superKeys.Left), ":SmartResizeLeft 2<CR>", opts)
keymap("n", mapKey("<S-%s>", superKeys.Rigth), ":SmartResizeRight 2<CR>", opts)
keymap("n", mapKey("<S-%s>", superKeys.Up), ":SmartResizeUp 1<CR>", opts)
keymap("n", mapKey("<S-%s>", superKeys.Down), ":SmartResizeDown 1<CR>", opts)

-- Split
keymap("n", mapKey("<leader>%s", superKeys.pipe), ":vsplit<CR>", opts)
keymap("n", mapKey("<leader>%s", superKeys.dash), ":split<CR>", opts)

