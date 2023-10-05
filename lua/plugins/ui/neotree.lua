return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function ()
    local neotree = require('neo-tree')

    neotree.setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
      close_if_last_window = true,
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName',
      },
      window = {
        width = 36,
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
        }
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    })
  end
}

