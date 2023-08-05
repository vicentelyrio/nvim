local leaderKeys = {
  a = 'a',
  c = 'c',
  w = 'w',
  e = 'e',
  t = 't',
  h = 'h',
  n = 'n',
  N = 'N',
  q = 'q',
  br = 'br',
  fd = 'fd',
  ff = 'ff',
  fw = 'fw',
  fc = 'fc',
  fg = 'fg',
  fz = 'fz',
  zn = 'zn',
  zf = 'zf',
  zm = 'zm',
  za = 'za',
}

local ctrlKeys = {
  h = 'h',
  j = 'j',
  k = 'k',
  l = 'l',
}

local superKeys = {
  l = 'l',
  h = 'h',
  tab = 'tab',
  Left = 'Left',
  Right = 'Right',
  Up = 'Up',
  Down = 'Down',
  pipe = '|',
  dash = '_',
}

local altKeys = {
  j = 'j',
  k = 'k',
}

local singleKeys = {
  forwardSlash = '>',
  backSlash = '<',
  tab = 'tab',
  bracketBack = '[d',
  bracketNext = ']d',
  J = 'J',
  K = 'K',
  gb = 'gb',
  gD = 'gD',
  gd = 'gd',
  gi = 'gi',
  gh = 'gh',
  gr = 'gr',
  ga = 'ga',
}

local function mapKey(command, key)
  return string.format(command, key)
end

return {
  leaderKeys = leaderKeys,
  superKeys = superKeys,
  altKeys = altKeys,
  ctrlKeys = ctrlKeys,
  singleKeys = singleKeys,
  mapKey = mapKey,

  lsp = {
    declaration = 'gD',
    definition = 'gd',
    definition_hover = 'K',
    implementation = 'gi',
    signature = 'gh',
    references = 'gr',
    diagnostic = 'gl',
    diagnostic_prev = '[d',
    diagnostic_next = ']d',
    diagnostic_setloclist = 'gq',
    code_action = 'ga',
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
    colorscheme = 'uc',
    zen_narrow = 'zn',
    zen_focus = 'zf',
    zen_minimalist = 'zm',
    zen_ataraxis = 'zz',
  },
  search = {
    find_files = 'ff',
    find_word = 'fw',
    find_history = 'fh',
  },
  git = {
    status = 'gs',
    blame = 'gb',
  },
}

