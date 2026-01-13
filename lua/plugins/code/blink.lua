return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = function()
    local keys = require 'settings.keyboard.keys'
    
    return {
      -- Custom key mappings using our keys.lua configuration
      keymap = {
        -- Completion control
        [keys.blink.complete] = { 'show', 'show_documentation' },
        [keys.blink.show_documentation] = { 'show_documentation' },
        [keys.blink.hide] = { 'hide' },
        [keys.blink.hide_documentation] = { 'hide_documentation' },
        [keys.blink.abort] = { 'hide' },
        [keys.blink.cancel] = { 'cancel' },
        
        -- Navigation
        [keys.blink.select_prev] = { 'select_prev' },
        [keys.blink.select_next] = { 'select_next' },
        [keys.blink.alt_select_prev] = { 'select_prev' },
        [keys.blink.alt_select_next] = { 'select_next' },
        
        -- Selection
        [keys.blink.select] = { 'accept' },
        -- select_and_replace removed as it's not supported by blink.cmp
        
        -- Scrolling
        [keys.blink.scroll_prev] = { 'scroll_documentation_up' },
        [keys.blink.scroll_next] = { 'scroll_documentation_down' },
        
        -- Snippet navigation
        [keys.blink.snippet_forward] = { 'snippet_forward' },
        [keys.blink.snippet_backward] = { 'snippet_backward' },
        
        -- Fallback
        [keys.blink.fallback] = { 'fallback' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    }
  end,
  opts_extend = { "sources.default" }
}
