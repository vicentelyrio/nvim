return {
  leader = ' ',
  treesitter = {
    select = {
      assign_outer = 'a=',
      assign_inner = 'i=',
      assign_lhs = 'l=',
      assign_rhs = 'r=',

      parameter_outer = 'aa',
      parameter_inner = 'ia',

      conditional_outer = 'ai',
      conditional_inner = 'ii',

      loop_outer = 'al',
      loop_inner = 'il',

      call_outer = 'af',
      call_inner = 'if',

      function_outer = 'am',
      function_inner = 'im',

      class_outer = 'ac',
      class_inner = 'ic',
    },
    swap = {
      next_parameter_inner = '<leader>na',
      next_function_outer = '<leader>nm',
      prev_parameter_inner = '<leader>pa',
      prev_function_outer = '<leader>pm',
    },
    move = {
      next_start_call_outer = ']f',
      next_start_function_outer = ']m',
      next_start_class_outer = ']c',
      next_start_conditional_outer = ']i',
      next_start_loop_outer = ']l',
      next_start_scope = ']s',
      next_start_fold = ']z',

      next_end_call_outer = ']F',
      next_end_function_outer = ']M',
      next_end_class_outer = ']C',
      next_end_conditional_outer = ']I',
      next_end_loop_outer = ']L',

      prev_start_call_outer = '[f',
      prev_start_function_outer = '[m',
      prev_start_class_outer = '[c',
      prev_start_conditional_outer = '[i',
      prev_start_loop_outer = '[l',

      prev_end_call_outer = '[F',
      prev_end_function_outer = '[M',
      prev_end_class_outer = '[C',
      prev_end_conditional_outer = '[I',
      prev_end_loop_outer = '[L',
    },
  },
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
  blink = {
    -- Navigation
    select_prev = '<Up>',
    select_next = '<Down>',
    
    -- Scrolling
    scroll_prev = '<C-b>',
    scroll_next = '<C-f>',
    
    -- Completion control
    complete = '<C-Space>',
    show_documentation = '<C-d>',
    hide = '<C-e>',
    hide_documentation = '<C-q>',
    
    -- Selection
    select = '<CR>',
    
    -- Snippet navigation
    snippet_forward = '<Tab>',
    snippet_backward = '<S-Tab>',
    
    -- Alternative navigation (vim-style)
    alt_select_prev = '<C-p>',
    alt_select_next = '<C-n>',
    
    -- Cancel/abort (using non-conflicting keys)
    abort = '<C-x>',
    cancel = '<C-q>',
    
    -- Fallback
    fallback = '<C-l>',
  },
  buffers = {
    list = '<leader>l',
    prev = '<S-h>',
    next = '<S-l>',
    last_prev = '<Tab>',
    last_next = '<S-Tab>',
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
  quickfix = {
    open = 'fq',
    close = 'fq',
    next = 'fn',
  },
  ui = {
    notifi_dismiss = '<leader>q',
    file_explorer = '<leader>e',
    colorscheme = '<leader>fc',
  },
  search = {
    find_files = 'ff',
    find_word = 'fw',
    find_history = 'fh',
    unselect = '<leader>h',
    spectre_open = '<leader>S',
    spectre_find_word = '<leader>sw',
    spectre_find_file = '<leader>sf',
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
  ts = {
    toggle = 'ge',
    go_to_definition = 'gr',
  }
}

