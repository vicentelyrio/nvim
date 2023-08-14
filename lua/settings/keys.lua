return {
  leader = ' ',
  lsp = {
    definition_hover = 'K',
    definition = 'gd',
    declaration = 'gD',
    implementation = 'gi',
    signature = 'gh',
    references = 'gr',
    code_action = 'ga',
    workspace_diagnostics = '<leader>xw',
    document_diagnostics = '<leader>xd',
    quickfix = '<leader>xq',
    loclist = '<leader>xl',
  },
  code = {
    paste = 'p',
    indent_back = '<',
    indent_forward = '>',
    move_word_back = '<leader>wb',
    move_word_forward = '<leader>wf',
    move_line_up = '<M-k>',
    move_line_down = '<M-j>',
  },
  cmp = {
    select_prev = '<C-k>',
    select_next = '<C-j>',
    scroll_prev = '<C-b>',
    scroll_next = '<C-f>',
    complete = '<C-Space>',
    disable = '<C-y>',
    abort = '<C-e>',
    select = '<CR>',
    cycle_next = '<tab>',
    cycle_prev = '<S-tab>',
  },
  buffers = {
    list = '<leader>l',
    prev = '<S-h>',
    next = '<S-l>',
    last_prev = '<tab>',
    last_next = '<S-tab>',
    close = '<leader>c',
    save = '<leader>w',
    new = '<leader>m',
    rename = '<leader>r',
    history = '<leader>t',
    move_left = '<C-h>',
    move_right = '<C-l>',
    move_up = '<C-k>',
    move_down = '<C-j>',
    resize_left = '<A-Left>',
    resize_right = '<A-right>',
    resize_up = '<A-Up>',
    resize_down = '<A-Down>',
    split_vertical = '<leader>|',
    split_horizontal = '<leader>-'
  },
  ui = {
    file_explorer = '<leader>e',
    colorscheme = '<leader>fc',
  },
  search = {
    find_files = 'ff',
    find_word = 'fw',
    find_history = 'fh',
    unselect = '<leader>h',
    next_select = 'n',
    prev_select = 'N',
  },
  git = {
    status = 'gs',
  },
  -- [[ Contextual Keybinds ]]
  trouble = {
    close = 'q', -- close the list
    cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
    refresh = 'r', -- manually refresh
    jump = { '<cr>', '<tab>', '<2-leftmouse>' }, -- jump to the diagnostic or open / close folds
    open_split = { '<c-x>' }, -- open buffer in new split
    open_vsplit = { '<c-v>' }, -- open buffer in new vsplit
    open_tab = { '<c-t>' }, -- open buffer in new tab
    jump_close = {'o'}, -- jump to the diagnostic and close the list
    toggle_mode = 'm', -- toggle between 'workspace' and 'document' diagnostics mode
    switch_severity = 's', -- switch 'diagnostics' severity filter level to hint / info / warn / error
    toggle_preview = 'p', -- toggle auto_preview
    hover = 'k', -- opens a small popup with the full multiline message
    preview = 'p', -- preview the diagnostic location
    open_code_href = 'c', -- if present, open a uri with more information about the diagnostic error
    close_folds = {'zm', 'zm'}, -- close all folds
    open_folds = {'zr', 'zr'}, -- open all folds
    toggle_fold = {'za', 'za'}, -- toggle fold of current file
    previous = 'k', -- previous item
    next = 'j', -- next item
    help = '?', -- help menu
  },
}

