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
  gl = 'gl',
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
}

