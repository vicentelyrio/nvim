-- Highlight yanked region {{{
-- Uses vim.hl.on_yank (Neovim 0.11+). Previously vim.highlight.on_yank.
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    -- Fallback chain handles 0.10 (vim.highlight) and 0.11+ (vim.hl)
    local hl = vim.hl or vim.highlight
    hl.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})
-- }}}

-- Remove trailing whitespace on save {{{
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('trim_trailing_whitespace', { clear = true }),
  pattern = '*',
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[silent! keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})
-- }}}
