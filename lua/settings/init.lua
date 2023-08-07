require 'settings.constants'
require 'settings.keyboard'

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- Backups {{{
opt.undofile = true         -- enable persistent undo
opt.swapfile = false        -- Don't use swapfile
opt.backup = false          -- creates a backup file
opt.writebackup = false     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.history = 100           -- Remember N lines in history
-- }}}

-- Tabs {{{
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
-- }}}

-- Clipboard {{{
opt.clipboard = 'unnamedplus'
opt.fixeol = true
-- }}}

-- Folding {{{
opt.foldmethod = 'syntax'
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
-- }}}

-- Search {{{
opt.ignorecase = true       -- Ignore case if all characters in lower case
opt.joinspaces = false      -- Join multiple spaces in search
opt.smartcase = true        -- When there is a one capital letter search for exact match
opt.showmatch = true        -- Highlight search instances
-- }}}

-- Window {{{
opt.splitbelow = true       -- Put new windows below current
opt.splitright = true       -- Put new vertical splits to right
-- }}}

-- UI {{{
--[[ opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options ]]
opt.mouse = 'a'                       -- Enable mouse support
opt.cmdheight = 0           -- Hide command line
opt.number = true           -- Show line number
opt.relativenumber = false  -- set relative numbered lines
opt.numberwidth = 3         -- set number column width {default 4}
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.linebreak = true        -- Wrap on word boundary
opt.wrap = false            -- display lines as one long line
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus = 3          -- Set global statusline
opt.conceallevel = 0        -- so that `` is visible in markdown files
opt.fileencoding = 'utf-8'  -- the encoding written to a file
opt.hlsearch = true         -- highlight all matches on previous search pattern
opt.pumheight = 10          -- pop up menu height
opt.showmode = true         -- show what mode we are
opt.showtabline = 1         -- hide tabline
opt.cursorline = true       -- highlight the current line
opt.signcolumn = "yes"      -- always show the sign column, otherwise it would shift the text each time
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = 'monospace:h17'

opt.hidden = true           -- Enable background buffers
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight

opt.updatetime = 300        -- faster completion (400ms default)
opt.timeoutlen = 600        -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 250        -- ms to wait for trigger an event
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = 'longest:full,full'
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g['loaded_' .. plugin] = 1
end
-- }}}

