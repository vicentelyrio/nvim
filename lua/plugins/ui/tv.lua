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

    -- recent files (replacement for Telescope oldfiles):
    -- tv's built-in `recent-files` channel reads television's *global* frecency
    -- db, not Neovim's recent files. And v:oldfiles is only a startup snapshot
    -- (it never changes mid-session) and is polluted with COMMIT_EDITMSG, temp
    -- files, etc. So we keep our own session MRU list, updated as you open files,
    -- and merge it in front of v:oldfiles for the persisted tail.
    local mru = {}
    local function should_track(buf)
      if vim.bo[buf].buftype ~= '' then return false end
      local name = vim.api.nvim_buf_get_name(buf)
      if name == '' then return false end
      if name:match('/%.git/') then return false end
      return vim.fn.filereadable(name) == 1
    end
    vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufWritePost' }, {
      group = vim.api.nvim_create_augroup('tv_mru', { clear = true }),
      callback = function(ev)
        if not should_track(ev.buf) then return end
        local full = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ev.buf), ':p')
        for i, v in ipairs(mru) do
          if v == full then table.remove(mru, i) break end
        end
        table.insert(mru, 1, full) -- most recent first
      end,
    })

    vim.keymap.set('n', keys.buffers.history, function()
      local seen, files = {}, {}
      local cwd = vim.fn.getcwd()
      local function add(f)
        local full = vim.fn.fnamemodify(f, ':p')
        if seen[full] then return end
        if full:match('/%.git/') then return end          -- COMMIT_EDITMSG, MERGE_MSG
        if vim.fn.filereadable(full) ~= 1 then return end  -- missing / oil:// etc.
        seen[full] = true
        files[#files + 1] = full
      end

      for _, f in ipairs(mru) do add(f) end           -- this session, most recent first
      for _, f in ipairs(vim.v.oldfiles) do add(f) end -- persisted history tail

      if #files == 0 then
        vim.notify('No recent files', vim.log.levels.INFO, { title = 'tv.nvim' })
        return
      end

      local tmp = vim.fn.tempname()
      vim.fn.writefile(files, tmp)

      local width = math.floor(vim.o.columns * 0.85)
      local height = math.floor(vim.o.lines * 0.85)
      local buf = vim.api.nvim_create_buf(false, true)
      local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = 'rounded',
        title = ' recent files ',
        title_pos = 'center',
        style = 'minimal',
      })

      -- use the `files` channel (for its file preview) but override its source
      -- with our oldfiles list. Strip the cwd prefix so paths render relative.
      vim.fn.jobstart({
        'tv', '--no-remote', '--no-status-bar',
        '--source-command', 'sed "s|^' .. cwd .. '/||" ' .. vim.fn.shellescape(tmp),
        '--layout', 'landscape',
        'files',
      }, {
        term = true,
        on_exit = function(_, code)
          local out = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
          pcall(vim.api.nvim_win_close, win, true)
          vim.fn.delete(tmp)
          if code ~= 0 then return end
          for _, line in ipairs(out) do
            local sel = vim.fn.trim(line)
            if sel ~= '' then
              vim.cmd('edit ' .. vim.fn.fnameescape(sel))
              return
            end
          end
        end,
      })
      vim.cmd('startinsert')
    end, { noremap = true, silent = true, desc = 'Recent files (oldfiles)' })

    -- colorscheme picker fallback (tv has no built-in colorscheme channel)
    vim.keymap.set('n', keys.ui.colorscheme, function()
      local schemes = vim.fn.getcompletion('', 'color')
      vim.ui.select(schemes, { prompt = 'Colorscheme' }, function(choice)
        if choice then vim.cmd.colorscheme(choice) end
      end)
    end, { noremap = true, silent = true, desc = 'Select colorscheme' })
  end,
}
