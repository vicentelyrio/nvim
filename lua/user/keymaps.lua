local opts = { noremap = true, silent = true }

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
keymap("n", "<S-l>", ":CybuNext<CR>", opts)
keymap("n", "<S-h>", ":CybuPrev<CR>", opts)

keymap("n", "<S-tab>", ":CybuLastusedPrev<CR>", opts)
keymap("n", "<tab>", ":CybuLastusedNext<CR>", opts)

-- Close buffers
keymap("n", "<leader>c", ":Bdelete<CR>", opts)

-- Save buffer
keymap("n", "<leader>w", ":w<CR>", opts)

-- Last Opened buffers
keymap("n", "<leader>t", ":MementoToggle<CR>", opts)

-- Code Folding

--[[ keymap('n', 'zR', require('ufo').openAllFolds) ]]
--[[ vim.keymap.set('n', 'zM', require('ufo').closeAllFolds) ]]

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<leader>fz", "<cmd>Telescope zoxide list<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Zen mode
keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
keymap("n", "<leader>zf", ":TZFocus<CR>", {})
keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Navigation
--
-- moving between splits
keymap("n", "<C-h>", ":SmartCursorMoveLeft<CR>", opts)
keymap("n", "<C-j>", ":SmartCursorMoveDown<CR>", opts)
keymap("n", "<C-k>", ":SmartCursorMoveUp<CR>", opts)
keymap("n", "<C-l>", ":SmartCursorMoveRight<CR>", opts)

keymap("n", "<S-Left>", ":SmartResizeLeft 2<CR>", opts)
keymap("n", "<S-Right>", ":SmartResizeRight 2<CR>", opts)
keymap("n", "<S-Up>", ":SmartResizeUp 1<CR>", opts)
keymap("n", "<S-Down>", ":SmartResizeDown 1<CR>", opts)

-- Split
keymap("n", "<leader>|", ":vsplit<CR>", opts)
keymap("n", "<leader>_", ":split<CR>", opts)

