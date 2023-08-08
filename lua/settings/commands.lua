cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]
cmd [[set formatoptions-=r formatoptions-=c formatoptions-=o]]

-- Highlight yanked {{{
cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 }
  augroup END
]]
--- }}}

-- Remove whitespaces on save {{{
cmd [[
  autocmd BufWritePre * :%s/\s\+$//e
]]
--- }}}

