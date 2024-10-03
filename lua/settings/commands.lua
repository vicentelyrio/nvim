-- cmd "set whichwrap+=<,>,[,],h,l"
-- cmd [[set iskeyword+=-]]
-- cmd [[set formatoptions-=r formatoptions-=c formatoptions-=o]]

-- Set associating between turned on plugins and filetype
vim.cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- Highlight yanked {{{
vim.cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 }
  augroup END
]]
--- }}}

-- Remove whitespaces on save {{{
vim.cmd [[
  autocmd BufWritePre * :%s/\s\+$//e
]]
--- }}}

-- Prevent root from changing after it's set
vim.cmd([[
  augroup ProjectRootLock
    autocmd!
    autocmd BufEnter * silent! let &autochdir = v:false | execute 'cd ' .. getcwd()
  augroup END
]])
