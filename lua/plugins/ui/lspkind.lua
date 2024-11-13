return {
  'onsails/lspkind-nvim',
  event = 'VeryLazy',
  config = function()
    local lspk = require('lspkind')

    lspk.init({
      mode = 'symbol',
      preset = 'codicons',
      symbol_map = {
        Supermaven = "",
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = 'ﰠ',
        Variable = '',
        Class = 'ﴯ',
        Interface = '',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = 'פּ',
        Event = '',
        Operator = '',
        TypeParameter = ''
      },
    })
  end
}

