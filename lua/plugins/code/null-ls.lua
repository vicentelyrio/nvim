local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
    require('typescript.extensions.null-ls.code-actions'),
		formatting.trim_whitespace,
		formatting.trim_newlines,

    diagnostics.dotenv_linter,
		diagnostics.stylint,
		diagnostics.tidy,
		diagnostics.tsc,
    diagnostics.standardjs,
		diagnostics.todo_comments,
		diagnostics.trail_space,

    completion.tags,
    completion.spell,
	},
})

