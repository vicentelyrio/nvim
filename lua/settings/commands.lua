vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=r formatoptions-=c formatoptions-=o]]

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

