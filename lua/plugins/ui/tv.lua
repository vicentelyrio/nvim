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
          -- substring (AND'd, space-separated) matching instead of fuzzy,
          -- so "import useFoo" only matches lines containing both literally
          args = { '--no-remote', '--no-status-bar', '--exact' },
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
        -- switch / create branches
        ['git-branch'] = {
          keybinding = keys.git.branches,
          handlers = {
            ['<CR>'] = function(entries)
              if #entries == 0 then return end
              -- tv prefixes remote branches with 'remotes/origin/...'; strip that
              -- so `git checkout` resolves it as a local tracking branch.
              local branch = entries[1]:gsub('^remotes/[^/]+/', ''):gsub('^%* ', '')
              vim.fn.system({ 'git', 'checkout', branch })
              if vim.v.shell_error == 0 then
                vim.notify('Switched to ' .. branch, vim.log.levels.INFO, { title = 'tv.nvim' })
              else
                vim.notify('Failed to checkout ' .. branch, vim.log.levels.ERROR, { title = 'tv.nvim' })
              end
            end,
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

    -- Generic helper: feed an arbitrary list of lines into a floating `tv`
    -- picker (used for anything nvim-internal that tv has no native channel
    -- for: recent files, open buffers, LSP symbols, colorschemes, ...).
    ---@param opts { lines: string[], title: string, channel?: string, args?: string[], on_select: fun(entries: string[]) }
    local function open_lines_picker(opts)
      if #opts.lines == 0 then
        vim.notify('Nothing to show', vim.log.levels.INFO, { title = 'tv.nvim' })
        return
      end

      local tmp = vim.fn.tempname()
      vim.fn.writefile(opts.lines, tmp)

      local width = math.floor(vim.o.columns * 0.85)
      local height = math.floor(vim.o.lines * 0.85)
      local buf = vim.api.nvim_create_buf(false, true)
      vim.bo[buf].filetype = 'tv'
      local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = 'rounded',
        title = opts.title,
        title_pos = 'center',
      })
      vim.wo[win].spell = false

      local cmd = {
        'tv', '--no-remote', '--no-status-bar', '--expect', 'enter',
        '--source-command', 'cat ' .. vim.fn.shellescape(tmp),
        '--layout', 'landscape',
      }
      vim.list_extend(cmd, opts.args or {})
      vim.list_extend(cmd, { opts.channel or 'files' })

      vim.fn.jobstart(cmd, {
        term = true,
        on_exit = function(_, code)
          local out = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          pcall(vim.api.nvim_win_close, 0, true)
          vim.fn.delete(tmp)
          if code ~= 0 then return end
          local entries = {}
          for _, line in ipairs(out) do
            local sel = vim.fn.trim(line)
            if sel ~= '' then entries[#entries + 1] = sel end
          end
          opts.on_select(entries)
        end,
      })
      vim.cmd('startinsert')
    end

    -- Recent files: in-session MRU + oldfiles, deduped, relative to cwd
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
        table.insert(mru, 1, full)
      end,
    })

    vim.keymap.set('n', keys.buffers.history, function()
      local seen, files = {}, {}
      local cwd = vim.fn.getcwd()
      local function add(f)
        local full = vim.fn.fnamemodify(f, ':p')
        if seen[full] then return end
        if full:match('/%.git/') then return end
        if vim.fn.filereadable(full) ~= 1 then return end
        seen[full] = true
        local rel = full
        if full:sub(1, #cwd + 1) == cwd .. '/' then
          rel = full:sub(#cwd + 2)
        end
        files[#files + 1] = rel
      end

      for _, f in ipairs(mru) do add(f) end
      for _, f in ipairs(vim.v.oldfiles) do add(f) end

      open_lines_picker({
        lines = files,
        title = ' recent files ',
        channel = 'files',
        on_select = function(entries) h.open_as_files(entries, require('tv.config').current) end,
      })
    end, { noremap = true, silent = true, desc = 'Recent files (oldfiles)' })

    -- Open buffers: tv has no nvim-aware "buffers" channel, so build one
    vim.keymap.set('n', keys.search.find_buffers, function()
      local cwd = vim.fn.getcwd()
      local seen, files = {}, {}
      for _, b in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted then
          local name = vim.api.nvim_buf_get_name(b)
          if name ~= '' and vim.fn.filereadable(name) == 1 then
            local full = vim.fn.fnamemodify(name, ':p')
            if not seen[full] then
              seen[full] = true
              local rel = full
              if full:sub(1, #cwd + 1) == cwd .. '/' then
                rel = full:sub(#cwd + 2)
              end
              files[#files + 1] = rel
            end
          end
        end
      end

      open_lines_picker({
        lines = files,
        title = ' buffers ',
        channel = 'files',
        on_select = function(entries) h.open_as_files(entries, require('tv.config').current) end,
      })
    end, { noremap = true, silent = true, desc = 'Open buffers' })

    -- LSP document symbols: flatten the (possibly nested) DocumentSymbol tree
    -- into file:line:col:kind name lines and reuse the text-channel parsing
    local function flatten_symbols(symbols, bufname, out, prefix)
      for _, sym in ipairs(symbols or {}) do
        local kind = vim.lsp.protocol.SymbolKind[sym.kind] or 'Unknown'
        local range = sym.range or (sym.location and sym.location.range)
        if range then
          local line = range.start.line + 1
          local col = range.start.character + 1
          local name = prefix and (prefix .. '.' .. sym.name) or sym.name
          table.insert(out, string.format('%s:%d:%d:[%s] %s', bufname, line, col, kind, name))
        end
        if sym.children then
          flatten_symbols(sym.children, bufname, out, prefix and (prefix .. '.' .. sym.name) or sym.name)
        end
      end
    end

    vim.keymap.set('n', keys.lsp.document_symbols, function()
      local bufnr = vim.api.nvim_get_current_buf()
      local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':.')
      local params = { textDocument = vim.lsp.util.make_text_document_params(bufnr) }
      local results = vim.lsp.buf_request_sync(bufnr, 'textDocument/documentSymbol', params, 2000)
      if not results then
        vim.notify('No LSP client attached', vim.log.levels.WARN, { title = 'tv.nvim' })
        return
      end

      local lines = {}
      for _, res in pairs(results) do
        if res.result then flatten_symbols(res.result, bufname, lines) end
      end

      open_lines_picker({
        lines = lines,
        title = ' document symbols ',
        channel = 'text',
        args = { '--exact' },
        on_select = h.open_at_line,
      })
    end, { noremap = true, silent = true, desc = 'LSP document symbols' })

    -- LSP workspace symbols: query with an empty string to get everything
    -- the server currently knows about, then let tv fuzzy-filter it.
    vim.keymap.set('n', keys.lsp.workspace_symbols, function()
      local bufnr = vim.api.nvim_get_current_buf()
      local results = vim.lsp.buf_request_sync(bufnr, 'workspace/symbol', { query = '' }, 3000)
      if not results then
        vim.notify('No LSP client attached', vim.log.levels.WARN, { title = 'tv.nvim' })
        return
      end

      local lines = {}
      for _, res in pairs(results) do
        for _, sym in ipairs(res.result or {}) do
          local uri = sym.location and sym.location.uri
          if uri then
            local file = vim.fn.fnamemodify(vim.uri_to_fname(uri), ':.')
            local range = sym.location.range
            local kind = vim.lsp.protocol.SymbolKind[sym.kind] or 'Unknown'
            local name = sym.containerName and (sym.containerName .. '.' .. sym.name) or sym.name
            table.insert(lines, string.format(
              '%s:%d:%d:[%s] %s', file, range.start.line + 1, range.start.character + 1, kind, name
            ))
          end
        end
      end

      open_lines_picker({
        lines = lines,
        title = ' workspace symbols ',
        channel = 'text',
        on_select = h.open_at_line,
      })
    end, { noremap = true, silent = true, desc = 'LSP workspace symbols' })

    -- colorscheme picker (tv has no built-in colorscheme channel)
    vim.keymap.set('n', keys.ui.colorscheme, function()
      open_lines_picker({
        lines = vim.fn.getcompletion('', 'color'),
        title = ' colorscheme ',
        channel = 'text',
        args = { '--exact' },
        on_select = function(entries)
          if entries[1] then vim.cmd.colorscheme(entries[1]) end
        end,
      })
    end, { noremap = true, silent = true, desc = 'Select colorscheme' })
  end,
}
