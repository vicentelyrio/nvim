return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local treesitter = require('nvim-treesitter.configs')
    local keys = require('settings.keyboard.keys')
    -- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

    treesitter.setup {
      ensure_installed = {
        'arduino',
        'astro',
        'bash',
        'c',
        'c_sharp',
        'cmake',
        'comment',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'gdscript',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'glsl',
        'go',
        'hjson',
        'html',
        'http',
        'hyprlang',
        'javascript',
        'jsdoc',
        'json5',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'prisma',
        'python',
        'regex',
        'robot',
        'rust',
        'scss',
        'todotxt',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = { '' },
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { 'yaml' }
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        select = {
          enable = false,
          lookahead = false,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            [keys.treesitter.select.assign_outer] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            [keys.treesitter.select.assign_inner] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            [keys.treesitter.select.assign_lhs] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            [keys.treesitter.select.assign_rhs] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

            [keys.treesitter.select.parameter_outer] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
            [keys.treesitter.select.parameter_inner] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

            [keys.treesitter.select.conditional_outer] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            [keys.treesitter.select.conditional_inner] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

            [keys.treesitter.select.loop_outer] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            [keys.treesitter.select.loop_inner] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

            [keys.treesitter.select.call_outer] = { query = '@call.outer', desc = 'Select outer part of a function call' },
            [keys.treesitter.select.call_inner] = { query = '@call.inner', desc = 'Select inner part of a function call' },

            [keys.treesitter.select.function_outer] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
            [keys.treesitter.select.function_inner] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

            [keys.treesitter.select.class_outer] = { query = '@class.outer', desc = 'Select outer part of a class' },
            [keys.treesitter.select.class_inner] = { query = '@class.inner', desc = 'Select inner part of a class' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            [keys.treesitter.swap.next_parameter_inner] = '@parameter.inner', -- swap parameters/argument with next
            [keys.treesitter.swap.next_function_outer] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            [keys.treesitter.swap.prev_parameter_inner] = '@parameter.inner', -- swap parameters/argument with prev
            [keys.treesitter.swap.prev_function_outer] = '@function.outer', -- swap function with previous
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [keys.treesitter.move.next_start_call_outer] = { query = '@call.outer', desc = 'Next function call start' },
            [keys.treesitter.move.next_start_function_outer] = { query = '@function.outer', desc = 'Next method/function def start' },
            [keys.treesitter.move.next_start_class_outer] = { query = '@class.outer', desc = 'Next class start' },
            [keys.treesitter.move.next_start_conditional_outer] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [keys.treesitter.move.next_start_loop_outer] = { query = '@loop.outer', desc = 'Next loop start' },

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            [keys.treesitter.move.next_start_scope] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            [keys.treesitter.move.next_start_fold] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [keys.treesitter.move.next_end_call_outer] = { query = '@call.outer', desc = 'Next function call end' },
            [keys.treesitter.move.next_end_function_outer] = { query = '@function.outer', desc = 'Next method/function def end' },
            [keys.treesitter.move.next_end_class_outer] = { query = '@class.outer', desc = 'Next class end' },
            [keys.treesitter.move.next_end_conditional_outer] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [keys.treesitter.move.next_end_loop_outer] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            [keys.treesitter.move.prev_start_call_outer] = { query = '@call.outer', desc = 'Prev function call start' },
            [keys.treesitter.move.prev_start_function_outer] = { query = '@function.outer', desc = 'Prev method/function def start' },
            [keys.treesitter.move.prev_start_class_outer] = { query = '@class.outer', desc = 'Prev class start' },
            [keys.treesitter.move.prev_start_conditional_outer] = { query = '@conditional.outer', desc = 'Prev conditional start' },
            [keys.treesitter.move.prev_start_loop_outer] = { query = '@loop.outer', desc = 'Prev loop start' },
          },
          goto_previous_end = {
            [keys.treesitter.move.prev_end_call_outer] = { query = '@call.outer', desc = 'Prev function call end' },
            [keys.treesitter.move.prev_end_function_outer] = { query = '@function.outer', desc = 'Prev method/function def end' },
            [keys.treesitter.move.prev_end_class_outer] = { query = '@class.outer', desc = 'Prev class end' },
            [keys.treesitter.move.prev_end_conditional_outer] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            [keys.treesitter.move.prev_end_loop_outer] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    }

    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
  end
}

