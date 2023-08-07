local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function nm(key, command)
	map('n', key, command, opts)
end

local function ni(key, command)
	map('i', key, command, opts)
end

local function nv(key, command)
	map('v', key, command, opts)
end

local function nt(key, command)
	map('t', key, command, opts)
end

--[[
-- Keycode table:
-- {
--  key: keycode string,
--  command: function,
--  type: 'n' | 'i' | 'v' | 'x' | 't' | 'c'
-- }
--]]
function MapKeys(keycodes)
  for _, row in ipairs(keycodes) do
    local key = row[1]
    local cmd = row[2]
    local type = row[3]

    map(type, key, cmd, opts)
  end
end

g.mapleader = ' '                                                                -- Use Space, like key for alternative hotkeys

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                     -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                               -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                    -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                               -- Go to declaration
 -- }}}

-- Telescope {{{
nm('gd', '<cmd>Telescope lsp_definitions<CR>')                                   -- Goto declaration
nm('<leader>p', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
nm('<leader>O', '<cmd>Telescope git_files<CR>')                                  -- Search for a file in project
nm('<leader>o', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
nm('<leader>i', '<cmd>Telescope jumplist<CR>')                                   -- Show jumplist (previous locations)
nm('<leader>b', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
nm('<leader>f', '<cmd>Telescope live_grep<CR>')                                  -- Find a string in project
nm('<leader>q', '<cmd>Telescope buffers<CR>')                                    -- Show all buffers
nm('<leader>a', '<cmd>Telescope<CR>')                                            -- Show all commands
nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols
-- }}}

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>')                                        -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>')                                      -- Show use of object in project
-- }}}

-- Neo Tree {{{
nm('<leader>e', '<cmd>NeoTreeFocusToggle<CR>')                                   -- Toggle file explorer
-- }}}

