-- Buffer line
-- see https://github.com/willothy/nvim-cokeline
return {
  'willothy/nvim-cokeline',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'stevearc/resession.nvim'
  },
  event = 'VeryLazy',
  config = function()
    local cokeline = require('cokeline')
    local get_hex = require('cokeline.hlgroups').get_hl_attr

    local yellow = vim.g.terminal_color_3

    cokeline.setup({
      default_hl = {
        fg = function(buffer)
          return
          buffer.is_focused
          and get_hex('Normal', 'fg')
          or get_hex('Comment', 'fg')
        end,
        bg = get_hex('ColorColumn', 'bg'),
      },
      sidebar = {
        filetype = {'NvimTree', 'neo-tree'},
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = yellow,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true,
          },
        }
      },

      components = {
        {
          text = '｜',
          fg = function(buffer)
            return
            buffer.is_modified and yellow or green
          end
        },
        {
          text = function(buffer) return buffer.devicon.icon .. ' ' end,
          fg = function(buffer) return buffer.devicon.color end,
        },
        {
          text = function(buffer) return buffer.index .. ': ' end,
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          fg = get_hex('Comment', 'fg'),
          italic = true,
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          bold = function(buffer) return buffer.is_focused end,
        },
        {
          text = ' ',
        },
      }
    })
  end
}
