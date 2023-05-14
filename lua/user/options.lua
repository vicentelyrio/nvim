-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.timeoutlen = 1000                 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                   -- enable persistent undo
opt.backup = false                    -- creates a backup file
opt.writebackup = false               -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.cmdheight = 0           -- Hide command line
opt.number = true           -- Show line number
opt.relativenumber = true   -- set relative numbered lines
opt.numberwidth = 3         -- set number column width {default 4}
opt.showmatch = false       -- Highlight matching parenthesis
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.wrap = false            -- display lines as one long line
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus = 3          -- Set global statusline
opt.conceallevel = 0        -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"  -- the encoding written to a file
opt.hlsearch = true         -- highlight all matches on previous search pattern
opt.pumheight = 10          -- pop up menu height
opt.showmode = true         -- show what mode we are
opt.showtabline = 1         -- hide tabline
opt.updatetime = 300        -- faster completion (4000ms default)
opt.cursorline = true       -- highlight the current line
opt.signcolumn = "yes"      -- always show the sign column, otherwise it would shift the text each time
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = "monospace:h17"

-----------------------------------------------------------
-- Fold
-----------------------------------------------------------
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- -- Disable builtin plugins
--[[ local disabled_built_ins = { ]]
--[[    "2html_plugin", ]]
--[[    "getscript", ]]
--[[    "getscriptPlugin", ]]
--[[    "gzip", ]]
--[[    "logipat", ]]
--[[    "netrw", ]]
--[[    "netrwPlugin", ]]
--[[    "netrwSettings", ]]
--[[    "netrwFileHandlers", ]]
--[[    "matchit", ]]
--[[    "tar", ]]
--[[    "tarPlugin", ]]
--[[    "rrhelper", ]]
--[[    "spellfile_plugin", ]]
--[[    "vimball", ]]
--[[    "vimballPlugin", ]]
--[[    "zip", ]]
--[[    "zipPlugin", ]]
--[[    "tutor", ]]
--[[    "rplugin", ]]
--[[    "synmenu", ]]
--[[    "optwin", ]]
--[[    "compiler", ]]
--[[    "bugreport", ]]
--[[    "ftplugin", ]]
--[[ } ]]
--[[]]
--[[ for _, plugin in pairs(disabled_built_ins) do ]]
--[[    g["loaded_" .. plugin] = 1 ]]
--[[ end ]]

-----------------------------------------------------------
-- Commands
-----------------------------------------------------------
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=r formatoptions-=c formatoptions-=o]]

-- Highlight yanked
vim.cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
  augroup END
]]

-- Remove whitespaces on save
vim.cmd [[
  autocmd BufWritePre * :%s/\s\+$//e
]]

