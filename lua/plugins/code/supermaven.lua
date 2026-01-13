return {
  'supermaven-inc/supermaven-nvim',
  event = "InsertEnter",
  config = function()
    require('supermaven-nvim').setup({
      -- Disable built-in keymaps to avoid conflicts
      disable_keymaps = true,
      -- Enable inline completion for supermaven suggestions
      disable_inline_completion = false,
    })
    
    -- Set up TAB to accept supermaven suggestions in insert mode
    vim.keymap.set('i', '<Tab>', function()
      local supermaven = require('supermaven-nvim.completion_preview')
      
      -- Accept supermaven suggestion if available
      if supermaven.has_suggestion() then
        supermaven.on_accept_suggestion()
        return
      end
      
      -- Otherwise, just insert a normal tab character
      return '<Tab>'
    end, { desc = 'Accept supermaven suggestion or insert tab' })
  end,
}
