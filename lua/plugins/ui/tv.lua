return {
  'alexpasmantier/tv.nvim',
  event = 'VeryLazy',
  cmd = 'Tv',
  config = function()
    local keys = require('settings.keyboard.keys')
    local h = require('tv').handlers

    require('tv').setup({
      layout = 'landscape',
      window = {
        width = 0.85,
        height = 0.85,
        border = 'rounded',
        title = ' tv.nvim ',
        title_pos = 'center',
      },
      channels = {
        -- find files in the project (respects project root via cwd)
        files = {
          keybinding = keys.search.find_files,
          handlers = {
            ['<CR>'] = h.open_as_files,
            ['<C-q>'] = h.send_to_quickfix,
            ['<C-s>'] = h.open_in_split,
            ['<C-v>'] = h.open_in_vsplit,
            ['<C-y>'] = h.copy_to_clipboard,
          },
        },
        -- ripgrep search through file contents
        text = {
          keybinding = keys.search.find_word,
          handlers = {
            ['<CR>'] = h.open_at_line,
            ['<C-q>'] = h.send_to_quickfix,
            ['<C-s>'] = h.open_in_split,
            ['<C-v>'] = h.open_in_vsplit,
            ['<C-y>'] = h.copy_to_clipboard,
          },
        },
        -- zoxide directory history (replacement for telescope-zoxide)
        zoxide = {
          keybinding = keys.search.find_history,
          handlers = {
            ['<CR>'] = function(entries)
              if #entries > 0 then
                vim.cmd('tcd ' .. vim.fn.fnameescape(entries[1]))
                vim.notify('cwd -> ' .. entries[1])
              end
            end,
            ['<C-y>'] = h.copy_to_clipboard,
          },
        },
        -- git log -> jump to commit / quickfix / copy hash
        ['git-log'] = {
          keybinding = keys.git.log,
          handlers = {
            ['<CR>'] = function(entries)
              if #entries > 0 then
                vim.cmd('enew | setlocal buftype=nofile bufhidden=wipe')
                vim.cmd('silent 0read !git show ' .. vim.fn.shellescape(entries[1]))
                vim.cmd('1delete _ | setlocal filetype=git nomodifiable')
                vim.cmd('normal! gg')
              end
            end,
            ['<C-y>'] = h.copy_to_clipboard,
          },
        },
        -- git status replacement: list changed files with stage/restore/edit
        ['git-diff'] = {
          keybinding = keys.git.status,
          handlers = {
            ['<CR>'] = h.open_as_files,
            ['<C-q>'] = h.send_to_quickfix,
            ['<C-s>'] = h.open_in_split,
            ['<C-v>'] = h.open_in_vsplit,
            ['<C-y>'] = h.copy_to_clipboard,
          },
        },
      },
      tv_binary = 'tv',
      global_keybindings = {
        channels = '<leader>tv', -- channel selector
      },
      quickfix = {
        auto_open = true,
      },
    })

    -- colorscheme picker fallback (tv has no built-in colorscheme channel)
    vim.keymap.set('n', keys.ui.colorscheme, function()
      local schemes = vim.fn.getcompletion('', 'color')
      vim.ui.select(schemes, { prompt = 'Colorscheme' }, function(choice)
        if choice then vim.cmd.colorscheme(choice) end
      end)
    end, { noremap = true, silent = true, desc = 'Select colorscheme' })
  end,
}
